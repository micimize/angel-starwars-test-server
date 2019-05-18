import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
import 'package:graphql_schema/graphql_schema.dart';

import './character.dart';
import './episode.dart';
import './starship.dart';

part 'human.g.dart';

@serializable
@graphQLClass
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

  // @GraphQLDocumentation(description: "Height in the preferred unit, default is meters")
  // height(unit: LengthUnit = METER): Float

  @GraphQLDocumentation(description: "Mass in kilograms, or null if unknown")
  double mass;

  @GraphQLDocumentation(
      description: "This human's friends, or an empty list if they have none")
  List<Character> friends;

//@GraphQLDocumentation(
//    description:
//        "A list of starships this person has piloted, or an empty list if none")
//List<Starship> starships;
}

final humanGraphql = """
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
