import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
import 'package:graphql_schema/graphql_schema.dart';

part 'starship.g.dart';

@serializable
@graphQLClass
abstract class _Starship extends Model {
  @GraphQLDocumentation(description: "The ID of the starship")
  @SerializableField(isNullable: false)
  String id;

  @GraphQLDocumentation(description: "The name of the starship")
  @SerializableField(isNullable: false)
  String name;

  @SerializableField(isNullable: false)
  List<double> coordinates;

  // int _length;
  // @GraphQLDocumentation(description: "Length of the starship, along the longest axis")
  // length(unit: LengthUnit = METER): Float

}

final starshipGraphql = """
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
