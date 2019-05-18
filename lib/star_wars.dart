import 'dart:async';
import 'dart:math';

import 'package:angel_framework/angel_framework.dart';
import 'package:angel_graphql/angel_graphql.dart';
import 'package:graphql_schema/graphql_schema.dart';
import 'package:graphql_server/graphql_server.dart';
import 'package:angel_typed_service/angel_typed_service.dart';
import 'package:graphql_server/mirrors.dart';

import 'src/models/models.dart';
import 'src/data.dart';

Future configureServer(Angel app) async {
  // Create standard Angel services. Note that these will also *automatically* be
  // exposed via a REST API as well.
  final droidService = mountService<Droid>(app, '/api/droids');
  final humansService = mountService<Human>(app, '/api/humans');
  final starshipService = mountService<Starship>(app, '/api/starships');
  final rnd = Random();

  // Create the GraphQL schema.
  // This code uses dart:mirrors to easily create GraphQL types from Dart PODO's.
  final starshipType = convertDartType(Starship);
  final episodeType = convertDartType(Episode);
  final droidType = convertDartClass(Droid);
  final humanType = convertDartClass(Human);

  // A Hero can be either a Droid or Human; create a union type that represents this.
  final heroType = GraphQLUnionType('Hero', [droidType, humanType]);

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
        listOf(droidType.nonNullable()),
        description: 'All droids in the known galaxy.',
        resolve: resolveViaServiceIndex(droidService),
      ),
      field(
        'humans',
        listOf(humanType.nonNullable()),
        description: 'All humans in the known galaxy.',
        resolve: resolveViaServiceIndex(humansService),
      ),
      field(
        'starships',
        listOf(starshipType.nonNullable()),
        description: 'All starships in the known galaxy.',
        resolve: resolveViaServiceIndex(starshipService),
      ),
      field(
        'hero',
        heroType,
        description:
            'Finds a random hero within the known galaxy, whether a Droid or Human.',
        inputs: [
          GraphQLFieldInput('ep', episodeType),
        ],
        resolve: randomHeroResolver(droidService, humansService, rnd),
      ),
    ],
  );

  // Convert our object types to input objects, so that they can be passed to
  // mutations.
  var humanChangesType = humanType.toInputObject('HumanChanges');

  // Create the mutation type.
  var mutationType = objectType(
    'StarWarsMutation',
    fields: [
      // We'll use the `modify_human` mutation to modify a human in the database.
      field(
        'modify_human',
        humanType.nonNullable(),
        description: 'Modifies a human in the database.',
        inputs: [
          GraphQLFieldInput('id', graphQLId.nonNullable()),
          GraphQLFieldInput('data', humanChangesType.nonNullable()),
        ],
        resolve: resolveViaServiceModify(humansService),
      ),
    ],
  );

  // Finally, create the schema.
  var schema = graphQLSchema(
    queryType: queryType,
    mutationType: mutationType,
  );

  // Next, create a GraphQL object, which will be passed to `graphQLHttp`, and
  // used to mount a spec-compliant GraphQL endpoint on the server.
  var graphQL = GraphQL(schema);

  // Mount the GraphQL endpoint.
  app.all('/graphql', graphQLHttp(graphQL));

  // In development, we'll want to mount GraphiQL, for easy management of the database.
  if (!app.environment.isProduction) {
    app.get('/graphiql', graphiQL());
  }

  for (final starship in data['starships']) {
    await starshipService.create(starship);
  }

  for (final human in data['humans']) {
    await humansService.create(human);
  }

  for (final droid in data['droids']) {
    await droidService.create(droid);
  }
}

GraphQLFieldResolver randomHeroResolver(
    Service droidService, Service humansService, Random rnd) {
  return (_, args) async {
    var allHeroes = [];
    Iterable allDroids = await droidService.index();
    Iterable allHumans = await humansService.index();
    allHeroes..addAll(allDroids)..addAll(allHumans);

    // Ignore the annoying cast here, hopefully Dart 2 fixes cases like this
    allHeroes = allHeroes
        .where((m) =>
            !args.containsKey('ep') ||
            (m['appears_in'].contains(args['ep']) as bool))
        .toList();

    return allHeroes.isEmpty ? null : allHeroes[rnd.nextInt(allHeroes.length)];
  };
}

Service mountService<T extends Model>(Angel app, String path) =>
    app.use(path, TypedService(MapService()));
