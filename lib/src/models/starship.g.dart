// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starship.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Starship extends _Starship {
  Starship(
      {@required this.id,
      @required this.name,
      @required List<double> coordinates,
      this.createdAt,
      this.updatedAt})
      : this.coordinates = List.unmodifiable(coordinates ?? []);

  @override
  final String id;

  @override
  final String name;

  @override
  final List<double> coordinates;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Starship copyWith(
      {String id,
      String name,
      List<double> coordinates,
      DateTime createdAt,
      DateTime updatedAt}) {
    return Starship(
        id: id ?? this.id,
        name: name ?? this.name,
        coordinates: coordinates ?? this.coordinates,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Starship &&
        other.id == id &&
        other.name == name &&
        ListEquality<double>(DefaultEquality<double>())
            .equals(other.coordinates, coordinates) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, name, coordinates, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "Starship(id=$id, name=$name, coordinates=$coordinates, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return StarshipSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const StarshipSerializer starshipSerializer = StarshipSerializer();

class StarshipEncoder extends Converter<Starship, Map> {
  const StarshipEncoder();

  @override
  Map convert(Starship model) => StarshipSerializer.toMap(model);
}

class StarshipDecoder extends Converter<Map, Starship> {
  const StarshipDecoder();

  @override
  Starship convert(Map map) => StarshipSerializer.fromMap(map);
}

class StarshipSerializer extends Codec<Starship, Map> {
  const StarshipSerializer();

  @override
  get encoder => const StarshipEncoder();
  @override
  get decoder => const StarshipDecoder();
  static Starship fromMap(Map map) {
    if (map['id'] == null) {
      throw FormatException("Missing required field 'id' on Starship.");
    }

    if (map['name'] == null) {
      throw FormatException("Missing required field 'name' on Starship.");
    }

    if (map['coordinates'] == null) {
      throw FormatException(
          "Missing required field 'coordinates' on Starship.");
    }

    return Starship(
        id: map['id'] as String,
        name: map['name'] as String,
        coordinates: map['coordinates'] is Iterable
            ? (map['coordinates'] as Iterable).cast<double>().toList()
            : null,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_Starship model) {
    if (model == null) {
      return null;
    }
    if (model.id == null) {
      throw FormatException("Missing required field 'id' on Starship.");
    }

    if (model.name == null) {
      throw FormatException("Missing required field 'name' on Starship.");
    }

    if (model.coordinates == null) {
      throw FormatException(
          "Missing required field 'coordinates' on Starship.");
    }

    return {
      'id': model.id,
      'name': model.name,
      'coordinates': model.coordinates,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class StarshipFields {
  static const List<String> allFields = <String>[
    id,
    name,
    coordinates,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String name = 'name';

  static const String coordinates = 'coordinates';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

/// Auto-generated from [Starship].
final GraphQLObjectType starshipGraphQLType =
    objectType('Starship', isInterface: false, interfaces: [], fields: [
  field('id', graphQLString),
  field('name', graphQLString),
  field('coordinates', listOf(graphQLFloat)),
  field('created_at', graphQLDate),
  field('updated_at', graphQLDate),
  field('idAsInt', graphQLInt)
]);
