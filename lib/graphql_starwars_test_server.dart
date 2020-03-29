import 'dart:async';
import 'dart:math';

import 'package:async/async.dart' show StreamGroup;
import 'package:angel_framework/angel_framework.dart';
import 'package:angel_graphql/angel_graphql.dart';
import 'package:angel_cors/angel_cors.dart';
import 'package:graphql_schema/graphql_schema.dart';
import 'package:graphql_server/graphql_server.dart';
import 'package:graphql_server/mirrors.dart';
import 'package:angel_typed_service/angel_typed_service.dart';

import 'src/models.dart';
import 'src/data.dart';

import 'review_generator.dart';

AngelConfigurer serverConfigurer({
  /// enable cors for easier flutter web connections
  bool enableCors = true,

  /// Generate reviews to test subscriptions with
  bool generateReviews = true,
}) =>
    (
      Angel app,
    ) async {
      // The default options will allow CORS for any request.
      // Combined with `fallback`, you can enable CORS application-wide.
      if (enableCors) {
        app.fallback(cors());
      }

      // Create standard Angel services. Note that these will also *automatically* be
      // exposed via a REST API as well.
      final droidService = mountService<Droid>(app, '/api/droids');
      final humansService = mountService<Human>(app, '/api/humans');
      final starshipService = mountService<Starship>(app, '/api/starships');
      final reviewService =
          mountService<Review>(app, '/api/starships', managed: true);

      final rnd = Random();

      // ~~A Hero can be either a Droid or Human; create a union type that represents this.~~
      // ~~final heroType = GraphQLUnionType('Hero', [droidGraphQLType, humanGraphQLType]);~~
      // A Hero can be any Character type
      final heroType = characterGraphQLType;

      final searchType = GraphQLUnionType('SearchResult',
          [droidGraphQLType, humanGraphQLType, starshipGraphQLType]);

      // Create the query type.
      //
      // Use the `resolveViaServiceIndex` helper to load data directly from an
      // Angel service.
      var queryType = objectType(
        'StarWarsQuery',
        description: 'A long time ago, in a galaxy far, far away...',
        fields: [
          field(
            'droids',
            listOf(droidGraphQLType.nonNullable()),
            description: 'All droids in the known galaxy.',
            resolve: resolveViaServiceIndex(droidService),
          ),
          field(
            'humans',
            listOf(humanGraphQLType.nonNullable()),
            description: 'All humans in the known galaxy.',
            resolve: resolveViaServiceIndex(humansService),
          ),
          field(
            'starships',
            listOf(starshipGraphQLType.nonNullable()),
            description: 'All starships in the known galaxy.',
            resolve: resolveViaServiceIndex(starshipService),
          ),
          field(
            'hero',
            heroType,
            description:
                'Finds a random hero within the known galaxy, whether a Droid or Human.',
            inputs: [
              GraphQLFieldInput('ep', episodeGraphQLType),
            ],
            resolve: randomServiceResolver([droidService, humansService], rnd),
          ),
          field(
            'randomEntity',
            searchType,
            description: 'Finds a random starship, droid, or human',
            resolve: randomServiceResolver(
                [droidService, humansService, starshipService], rnd),
          ),
          field(
            'reviews',
            objectType(
              'ReviewResults',
              description:
                  'Paginating movie review api. Returns { reviews, page }',
              fields: [
                field(
                  'page',
                  graphQLInt,
                  description: 'The page index',
                ),
                field(
                  'reviews',
                  listOf(reviewGraphQLType.nonNullable()),
                  description: 'The list of reviews',
                ),
              ],
            ),
            inputs: [
              GraphQLFieldInput(
                'page',
                graphQLInt,
                defaultValue: 0,
                description: 'which page to get from the api',
              )
            ],
            resolve: (dynamic _, inputs) {
              return <String, Object>{
                'page': inputs['page'],
                'reviews': directory.pageAsJson(inputs['page'] as int),
              };
            },
          ),
        ],
      );

      // Convert our object types to input objects, so that they can be passed to
      // mutations.
      final humanInputType = humanGraphQLType.toInputObject('HumanInput');

      final reviewInputType = reviewGraphQLType.toInputObject('ReviewInput');

      // Create the mutation type.
      var mutationType = objectType(
        'StarWarsMutation',
        fields: [
          field(
            'updateHuman',
            humanGraphQLType.nonNullable(),
            description: 'Updates a human in the database.',
            inputs: [
              GraphQLFieldInput('id', graphQLId.nonNullable()),
              GraphQLFieldInput('data', humanInputType.nonNullable()),
            ],
            resolve: resolveViaServiceUpdate(humansService),
          ),
          field(
            'deleteHuman',
            humanGraphQLType.nonNullable(),
            description: 'Delete a human in the database.',
            inputs: [
              GraphQLFieldInput('id', graphQLId.nonNullable()),
            ],
            resolve: resolveViaServiceRemove(humansService),
          ),
          // We'll use the `modifyHuman` mutation to modify a human in the database.
          field(
            'createReview',
            reviewGraphQLType.nonNullable(),
            description: 'Creates a review',
            inputs: [
              GraphQLFieldInput('data', reviewInputType.nonNullable()),
            ],
            resolve: resolveViaServiceCreate(reviewService),
          ),
        ],
      );

      final reviewAdded =
          reviewService.afterCreated.asStream().map((e) => e.result);

      final reviewStream = (generateReviews
              ? StreamGroup.merge([
                  randomReviewStream().map((r) => r.toJson()),
                  reviewAdded,
                ])
              : reviewAdded)
          .map((reviewJson) =>
              {'reviewAdded': reviewJson as Map<String, dynamic>})
          .asBroadcastStream();

      final subscriptionType = objectType(
        'Subscription',
        fields: [
          field('reviewAdded', reviewGraphQLType,
              resolve: (_, __) => reviewStream),
        ],
      );

      // Finally, create the schema.
      var schema = graphQLSchema(
        queryType: queryType,
        mutationType: mutationType,
        subscriptionType: subscriptionType,
      );

      // Next, create a GraphQL object, which will be passed to `graphQLHttp`, and
      // used to mount a spec-compliant GraphQL endpoint on the server.
      var graphQL = GraphQL(schema,
          introspect: true,
          customTypes: [
            episodeGraphQLType,
            starshipGraphQLType,
            droidGraphQLType,
            humanGraphQLType,
            reviewGraphQLType,
          ],
          defaultFieldResolver: mirrorsFieldResolver);

      // Mount the GraphQL endpoint.
      app.all('/graphql', graphQLHttp(graphQL));

      app.get(
        '/subscriptions',
        graphQLWS(
          graphQL,
          keepAliveInterval: Duration(seconds: 3),
        ),
      );

      // In development, we'll want to mount GraphiQL, for easy management of the database.
      if (!app.environment.isProduction) {
        app.get(
            '/graphiql',
            graphiQL(
                //subscriptionsEndpoint: 'ws://localhost:3000/subscriptions',
                ));
      }

      // TODO replace MapService with a relational cache from graphql/client
      // we're inlining relations here for now

      Map<String, Object> starshipMap = {};
      Map<String, Object> friendMap = {};

      for (final friend in [...data['humans'], ...data['droids']]) {
        friendMap[friend['id'] as String] = friend;
      }

      for (final starship in data['starships']) {
        starshipMap[starship['id'] as String] = starship;
        await starshipService.create(starship);
      }

      List<dynamic> denormalize(dynamic ids, Map<String, dynamic> relation) =>
          ((ids ?? const <String>[]) as List)
              .cast<String>()
              .map((String id) => relation[id])
              .toList();

      for (final human in data['humans']) {
        human['friends'] = denormalize(human['friends'], friendMap);
        human['starships'] = denormalize(human['starships'], starshipMap);
        await humansService.create(human);
      }

      for (final droid in data['droids']) {
        droid['friends'] = denormalize(droid['friends'], friendMap);
        await droidService.create(droid);
      }
    };

GraphQLFieldResolver randomServiceResolver(List<Service> services, Random rnd) {
  return (_, args) async {
    var allOptions = (await Future.wait(services.map((s) => s.index())))
        .expand((options) => options)
        .toList();

    return allOptions.isEmpty
        ? null
        : allOptions[rnd.nextInt(allOptions.length)];
  };
}

// TODO can't use proper typing
HookedService mountService<T extends Model>(
  Angel app,
  String path, {
  bool managed = false,
}) {
  final service = TypedService(MapService(
    autoIdAndDateFields: managed,
    autoSnakeCaseNames: false,
  ));
  final hooked = app.use(path, service);
  return hooked;
}

/// Default configurer
final configureServer = serverConfigurer();
