import 'package:graphql_schema/graphql_schema.dart';

import './episode.dart';

part 'character.g.dart';

@graphQLClass
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
