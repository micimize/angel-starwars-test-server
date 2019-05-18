import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
import 'package:graphql_schema/graphql_schema.dart';

import './character.dart';
import './episode.dart';

part 'droid.g.dart';

@serializable
@graphQLClass
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
}

final droidGraphql = """

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
