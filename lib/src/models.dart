import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
import 'package:graphql_schema/graphql_schema.dart';

// part 'models.g.dart';
part 'models_g.dart';

@GraphQLDocumentation(description: 'The episodes in the Star Wars trilogy')
@graphQLClass
enum Episode {
  NEWHOPE,
  EMPIRE,
  JEDI,
}

final episodeGraphql = """
# The episodes in the Star Wars trilogy
enum Episode {
  # Star Wars Episode IV: A New Hope, released in 1977.
  NEWHOPE

  # Star Wars Episode V: The Empire Strikes Back, released in 1980.
  EMPIRE

  # Star Wars Episode VI: Return of the Jedi, released in 1983.
  JEDI
}
""";

// @serializable
// @graphQLClass
abstract class _Starship extends Model {
  @GraphQLDocumentation(description: "The ID of the starship")
  @SerializableField(isNullable: false)
  String id;

  @GraphQLDocumentation(description: "The name of the starship")
  @SerializableField(isNullable: false)
  String name;

  @GraphQLDocumentation(
      description: "Length of the starship, along the longest axis")
  double length;

  @SerializableField(isNullable: false)
  List<double> coordinates;

  // int _length;
  // @GraphQLDocumentation(description: "Length of the starship, along the longest axis")
  // length(unit: LengthUnit = METER): Float

  final graphql = """
    type Starship {
      # The ID of the starship
      id: ID!

      # The name of the starship
      name: String!

      # Length of the starship, along the longest axis
      length(unit: LengthUnit = METER): Float

      coordinates: [[Float!]!]
    }
  """;
}

// @graphQLClass
abstract class Character {
  @GraphQLDocumentation(description: "The ID of the character")
  String get id;

  @GraphQLDocumentation(description: "The name of the character")
  String get name;

  @GraphQLDocumentation(
      description:
          "The friends of the character, or an empty list if they have none")
  List<Character> get friends;

  // @GraphQLDocumentation(description: "The friends of the character exposed as a connection with edges")
  // friendsConnection(first: Int, after: ID): FriendsConnection!

  @GraphQLDocumentation(description: "The movies this character appears in")
  List<Episode> get appearsIn;

  static final graphql = """
    # A character from the Star Wars universe
    interface Character {
      # The ID of the character
      id: ID!

      # The name of the character
      name: String!

      # The friends of the character, or an empty list if they have none
      friends: [Character]

      # The friends of the character exposed as a connection with edges
      friendsConnection(first: Int, after: ID): FriendsConnection!

      # The movies this character appears in
      appearsIn: [Episode]!
    }
  """;
}

typedef GetFields = Iterable<GraphQLObjectField> Function(
    SelfRefObjectType self);

typedef GetInputFields = Iterable<GraphQLInputObjectField> Function(
  SelfRefObjectType source,
  SelfRefInputObjectType self,
);

class SelfRefInputObjectType extends GraphQLInputObjectType {
  SelfRefInputObjectType(
    String name, {
    String description,
    @required SelfRefObjectType source,
    GetInputFields getInputFields,
  }) : super(name, description: description) {
    inputFields.addAll(getInputFields(source, this) ?? []);
  }
}

class SelfRefObjectType extends GraphQLObjectType {
  SelfRefObjectType(
    String name, {
    String description,
    bool isInterface: false,
    GetFields getFields,
    Iterable<GraphQLObjectType> interfaces = const [],
  }) : super(name, description, isInterface: isInterface) {
    fields.addAll(getFields(this) ?? []);
    if (interfaces?.isNotEmpty == true) {
      for (var i in interfaces) {
        inheritFrom(i);
      }
    }
  }

  GraphQLInputObjectType toInputObject(String name, {String description}) {
    return SelfRefInputObjectType(
      name,
      description: description ?? this.description,
      source: this,
      getInputFields: (source, self) => fields.map((f) {
        return f.type == source
            ? self as GraphQLInputObjectField
            : f.type is GraphQLListType &&
                    (f.type as GraphQLListType).ofType == source
                ? GraphQLInputObjectField<dynamic, dynamic>(
                    f.name,
                    GraphQLListType(self),
                  )
                : GraphQLInputObjectField<dynamic, dynamic>(
                    f.name,
                    f.type.coerceToInputObject(),
                    description: f.description,
                  );
      }),
    );
  }
}

GraphQLObjectType characterGraphQLType = SelfRefObjectType(
  'Character',
  isInterface: true,
  interfaces: [],
  getFields: (self) => [
    field<String, String>('id', graphQLString,
        description: 'The ID of the character'),
    field<String, String>('name', graphQLString,
        description: 'The name of the character'),
    field<dynamic, dynamic>('friends', listOf(self),
        description:
            'The friends of the character, or an empty list if they have none'),
    field<dynamic, dynamic>(
      'appearsIn',
      listOf(episodeGraphQLType),
      description: 'The movies this character appears in',
    ),
    field<dynamic, dynamic>('graphql', graphQLString)
  ],
);

// @serializable
// @graphQLClass
abstract class _Droid extends Model implements Character {
  @GraphQLDocumentation(description: "The ID of the droid")
  @SerializableField(isNullable: false)
  String id;

  @GraphQLDocumentation(description: "What others call this droid")
  @SerializableField(isNullable: false)
  String name;

  @GraphQLDocumentation(
      description: "This droid's friends, or an empty list if they have none")
  List<Character> friends;

  // @GraphQLDocumentation(description: "The friends of the droid exposed as a connection with edges")
  // friendsConnection(first: Int, after: ID): FriendsConnection!

  @GraphQLDocumentation(description: "The movies this droid appears in")
  @SerializableField(isNullable: false)
  List<Episode> appearsIn;

  @GraphQLDocumentation(description: "This droid's primary function")
  String primaryFunction;

  static final graphql = """
    # An autonomous mechanical character in the Star Wars universe
    type Droid implements Character {
      # The ID of the droid
      id: ID!

      # What others call this droid
      name: String!

      # This droid's friends, or an empty list if they have none
      friends: [Character]

      # The friends of the droid exposed as a connection with edges
      friendsConnection(first: Int, after: ID): FriendsConnection!

      # The movies this droid appears in
      appearsIn: [Episode]!

      # This droid's primary function
      primaryFunction: String
    }

    """;
}

// @serializable
// @graphQLClass
abstract class _Human extends Model implements Character {
  @GraphQLDocumentation(description: "The ID of the human")
  @SerializableField(isNullable: false)
  String id;

  @GraphQLDocumentation(description: "What this human calls themselves")
  @SerializableField(isNullable: false)
  String name;

  @GraphQLDocumentation(description: "The movies this human appears in")
  @SerializableField(isNullable: false)
  List<Episode> appearsIn;

  @GraphQLDocumentation(
      description: "The home planet of the human, or null if unknown")
  String homePlanet;

  // TODO method?
  @GraphQLDocumentation(
      description: "Height in the preferred unit, default is meters")
  @SerializableField(isNullable: false)
  double height;

  @GraphQLDocumentation(description: "Mass in kilograms, or null if unknown")
  double mass;

  @GraphQLDocumentation(
      description: "This human's friends, or an empty list if they have none")
  List<Character> friends;

  @GraphQLDocumentation(
    description:
        "A list of starships this person has piloted, or an empty list if none",
  )
  @SerializableField()
  List<Starship> starships;

  static final graphql = """
    type Human implements Character {
      # The ID of the human
      id: ID!

      # What this human calls themselves
      name: String!

      # The home planet of the human, or null if unknown
      homePlanet: String

      # Height in the preferred unit, default is meters
      height(unit: LengthUnit = METER): Float

      # Mass in kilograms, or null if unknown
      mass: Float

      # This human's friends, or an empty list if they have none
      friends: [Character]

      # The friends of the human exposed as a connection with edges
      friendsConnection(first: Int, after: ID): FriendsConnection!

      # The movies this human appears in
      appearsIn: [Episode]!

      # A list of starships this person has piloted, or an empty list if none
      starships: [Starship]
    }
  """;
}

@serializable
@graphQLClass
abstract class _Review extends Model {
  @GraphQLDocumentation(description: "The movie")
  @SerializableField(isNullable: false)
  Episode episode;

  @GraphQLDocumentation(
      description: "The number of stars this review gave, 1-5")
  @SerializableField(isNullable: false)
  int stars;

  @GraphQLDocumentation(description: "Comment about the movie")
  String commentary;

  final graphql = """
    # Represents a review for a movie
    type Review {
      # The movie
      episode: Episode

      # The number of stars this review gave, 1-5
      stars: Int!

      # Comment about the movie
      commentary: String
    }
  """;
}
