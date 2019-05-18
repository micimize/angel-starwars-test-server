// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Human extends _Human {
  Human(
      {@required this.id,
      @required this.name,
      @required List<dynamic> appearsIn,
      this.homePlanet,
      this.mass,
      List<Character> friends,
      this.createdAt,
      this.updatedAt})
      : this.appearsIn = List.unmodifiable(appearsIn ?? []),
        this.friends = List.unmodifiable(friends ?? []);

  @override
  final String id;

  @override
  final String name;

  @override
  final List<dynamic> appearsIn;

  @override
  final String homePlanet;

  @override
  final double mass;

  @override
  final List<Character> friends;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Human copyWith(
      {String id,
      String name,
      List<dynamic> appearsIn,
      String homePlanet,
      double mass,
      List<Character> friends,
      DateTime createdAt,
      DateTime updatedAt}) {
    return Human(
        id: id ?? this.id,
        name: name ?? this.name,
        appearsIn: appearsIn ?? this.appearsIn,
        homePlanet: homePlanet ?? this.homePlanet,
        mass: mass ?? this.mass,
        friends: friends ?? this.friends,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Human &&
        other.id == id &&
        other.name == name &&
        ListEquality<dynamic>(DefaultEquality())
            .equals(other.appearsIn, appearsIn) &&
        other.homePlanet == homePlanet &&
        other.mass == mass &&
        ListEquality<Character>(DefaultEquality<Character>())
            .equals(other.friends, friends) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, name, appearsIn, homePlanet, mass, friends, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "Human(id=$id, name=$name, appearsIn=$appearsIn, homePlanet=$homePlanet, mass=$mass, friends=$friends, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return HumanSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const HumanSerializer humanSerializer = HumanSerializer();

class HumanEncoder extends Converter<Human, Map> {
  const HumanEncoder();

  @override
  Map convert(Human model) => HumanSerializer.toMap(model);
}

class HumanDecoder extends Converter<Map, Human> {
  const HumanDecoder();

  @override
  Human convert(Map map) => HumanSerializer.fromMap(map);
}

class HumanSerializer extends Codec<Human, Map> {
  const HumanSerializer();

  @override
  get encoder => const HumanEncoder();
  @override
  get decoder => const HumanDecoder();
  static Human fromMap(Map map) {
    if (map['id'] == null) {
      throw FormatException("Missing required field 'id' on Human.");
    }

    if (map['name'] == null) {
      throw FormatException("Missing required field 'name' on Human.");
    }

    if (map['appears_in'] == null) {
      throw FormatException("Missing required field 'appears_in' on Human.");
    }

    return Human(
        id: map['id'] as String,
        name: map['name'] as String,
        appearsIn: map['appears_in'] is Iterable
            ? (map['appears_in'] as Iterable).cast<dynamic>().toList()
            : null,
        homePlanet: map['home_planet'] as String,
        mass: map['mass'] as double,
        friends: map['friends'] is Iterable
            ? (map['friends'] as Iterable).cast<Character>().toList()
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

  static Map<String, dynamic> toMap(_Human model) {
    if (model == null) {
      return null;
    }
    if (model.id == null) {
      throw FormatException("Missing required field 'id' on Human.");
    }

    if (model.name == null) {
      throw FormatException("Missing required field 'name' on Human.");
    }

    if (model.appearsIn == null) {
      throw FormatException("Missing required field 'appears_in' on Human.");
    }

    return {
      'id': model.id,
      'name': model.name,
      'appears_in': model.appearsIn,
      'home_planet': model.homePlanet,
      'mass': model.mass,
      'friends': model.friends,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class HumanFields {
  static const List<String> allFields = <String>[
    id,
    name,
    appearsIn,
    homePlanet,
    mass,
    friends,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String name = 'name';

  static const String appearsIn = 'appears_in';

  static const String homePlanet = 'home_planet';

  static const String mass = 'mass';

  static const String friends = 'friends';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
