// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'droid.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Droid extends _Droid {
  Droid(
      {@required this.id,
      @required this.name,
      List<Character> friends,
      @required List<dynamic> appearsIn,
      this.primaryFunction,
      this.createdAt,
      this.updatedAt})
      : this.friends = List.unmodifiable(friends ?? []),
        this.appearsIn = List.unmodifiable(appearsIn ?? []);

  @override
  final String id;

  @override
  final String name;

  @override
  final List<Character> friends;

  @override
  final List<dynamic> appearsIn;

  @override
  final String primaryFunction;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Droid copyWith(
      {String id,
      String name,
      List<Character> friends,
      List<dynamic> appearsIn,
      String primaryFunction,
      DateTime createdAt,
      DateTime updatedAt}) {
    return Droid(
        id: id ?? this.id,
        name: name ?? this.name,
        friends: friends ?? this.friends,
        appearsIn: appearsIn ?? this.appearsIn,
        primaryFunction: primaryFunction ?? this.primaryFunction,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Droid &&
        other.id == id &&
        other.name == name &&
        ListEquality<Character>(DefaultEquality<Character>())
            .equals(other.friends, friends) &&
        ListEquality<dynamic>(DefaultEquality())
            .equals(other.appearsIn, appearsIn) &&
        other.primaryFunction == primaryFunction &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        [id, name, friends, appearsIn, primaryFunction, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "Droid(id=$id, name=$name, friends=$friends, appearsIn=$appearsIn, primaryFunction=$primaryFunction, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return DroidSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const DroidSerializer droidSerializer = DroidSerializer();

class DroidEncoder extends Converter<Droid, Map> {
  const DroidEncoder();

  @override
  Map convert(Droid model) => DroidSerializer.toMap(model);
}

class DroidDecoder extends Converter<Map, Droid> {
  const DroidDecoder();

  @override
  Droid convert(Map map) => DroidSerializer.fromMap(map);
}

class DroidSerializer extends Codec<Droid, Map> {
  const DroidSerializer();

  @override
  get encoder => const DroidEncoder();
  @override
  get decoder => const DroidDecoder();
  static Droid fromMap(Map map) {
    if (map['id'] == null) {
      throw FormatException("Missing required field 'id' on Droid.");
    }

    if (map['name'] == null) {
      throw FormatException("Missing required field 'name' on Droid.");
    }

    if (map['appears_in'] == null) {
      throw FormatException("Missing required field 'appears_in' on Droid.");
    }

    return Droid(
        id: map['id'] as String,
        name: map['name'] as String,
        friends: map['friends'] is Iterable
            ? (map['friends'] as Iterable).cast<Character>().toList()
            : null,
        appearsIn: map['appears_in'] is Iterable
            ? (map['appears_in'] as Iterable).cast<dynamic>().toList()
            : null,
        primaryFunction: map['primary_function'] as String,
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

  static Map<String, dynamic> toMap(_Droid model) {
    if (model == null) {
      return null;
    }
    if (model.id == null) {
      throw FormatException("Missing required field 'id' on Droid.");
    }

    if (model.name == null) {
      throw FormatException("Missing required field 'name' on Droid.");
    }

    if (model.appearsIn == null) {
      throw FormatException("Missing required field 'appears_in' on Droid.");
    }

    return {
      'id': model.id,
      'name': model.name,
      'friends': model.friends,
      'appears_in': model.appearsIn,
      'primary_function': model.primaryFunction,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class DroidFields {
  static const List<String> allFields = <String>[
    id,
    name,
    friends,
    appearsIn,
    primaryFunction,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String name = 'name';

  static const String friends = 'friends';

  static const String appearsIn = 'appears_in';

  static const String primaryFunction = 'primary_function';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
