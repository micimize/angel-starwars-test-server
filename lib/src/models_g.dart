// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Starship extends _Starship {
  Starship(
      {@required this.id,
      @required this.name,
      this.length,
      @required List<double> coordinates,
      this.createdAt,
      this.updatedAt})
      : this.coordinates = List.unmodifiable(coordinates ?? <double>[]);

  @override
  final String id;

  @override
  final String name;

  @override
  final double length;

  @override
  final List<double> coordinates;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Starship copyWith(
      {String id,
      String name,
      double length,
      List<double> coordinates,
      DateTime createdAt,
      DateTime updatedAt}) {
    return Starship(
        id: id ?? this.id,
        name: name ?? this.name,
        length: length ?? this.length,
        coordinates: coordinates ?? this.coordinates,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(Object other) {
    return other is _Starship &&
        other.id == id &&
        other.name == name &&
        other.length == length &&
        ListEquality<double>(DefaultEquality<double>())
            .equals(other.coordinates, coordinates) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        <Object>[id, name, length, coordinates, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "Starship(id=$id, name=$name, length=$length, coordinates=$coordinates, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return StarshipSerializer.toMap(this);
  }
}

@generatedSerializable
class Droid extends _Droid {
  Droid(
      {@required this.id,
      @required this.name,
      List<Character> friends,
      @required List<Episode> appearsIn,
      this.primaryFunction,
      this.createdAt,
      this.updatedAt})
      : this.friends = List.unmodifiable(friends ?? <Character>[]),
        this.appearsIn = List.unmodifiable(appearsIn ?? <Episode>[]);

  @override
  final String id;

  @override
  final String name;

  @override
  final List<Character> friends;

  @override
  final List<Episode> appearsIn;

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
      List<Episode> appearsIn,
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

  bool operator ==(Object other) {
    return other is _Droid &&
        other.id == id &&
        other.name == name &&
        ListEquality<Character>(DefaultEquality<Character>())
            .equals(other.friends, friends) &&
        ListEquality<Episode>(DefaultEquality<Episode>())
            .equals(other.appearsIn, appearsIn) &&
        other.primaryFunction == primaryFunction &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(<Object>[
      id,
      name,
      friends,
      appearsIn,
      primaryFunction,
      createdAt,
      updatedAt
    ]);
  }

  @override
  String toString() {
    return "Droid(id=$id, name=$name, friends=$friends, appearsIn=$appearsIn, primaryFunction=$primaryFunction, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return DroidSerializer.toMap(this);
  }
}

@generatedSerializable
class Human extends _Human {
  Human(
      {@required this.id,
      @required this.name,
      @required List<Episode> appearsIn,
      this.homePlanet,
      @required this.height,
      this.mass,
      List<Character> friends,
      List<Starship> starships,
      this.createdAt,
      this.updatedAt})
      : this.appearsIn = List.unmodifiable(appearsIn ?? <Episode>[]),
        this.friends = List.unmodifiable(friends ?? <Character>[]),
        this.starships = List.unmodifiable(starships ?? <Starship>[]);

  @override
  final String id;

  @override
  final String name;

  @override
  final List<Episode> appearsIn;

  @override
  final String homePlanet;

  @override
  final double height;

  @override
  final double mass;

  @override
  final List<Character> friends;

  @override
  final List<Starship> starships;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Human copyWith(
      {String id,
      String name,
      List<Episode> appearsIn,
      String homePlanet,
      double height,
      double mass,
      List<Character> friends,
      List<Starship> starships,
      DateTime createdAt,
      DateTime updatedAt}) {
    return Human(
        id: id ?? this.id,
        name: name ?? this.name,
        appearsIn: appearsIn ?? this.appearsIn,
        homePlanet: homePlanet ?? this.homePlanet,
        height: height ?? this.height,
        mass: mass ?? this.mass,
        friends: friends ?? this.friends,
        starships: starships ?? this.starships,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(Object other) {
    return other is _Human &&
        other.id == id &&
        other.name == name &&
        ListEquality<Episode>(DefaultEquality<Episode>())
            .equals(other.appearsIn, appearsIn) &&
        other.homePlanet == homePlanet &&
        other.height == height &&
        other.mass == mass &&
        ListEquality<Character>(DefaultEquality<Character>())
            .equals(other.friends, friends) &&
        ListEquality<Starship>(DefaultEquality<Starship>())
            .equals(other.starships, starships) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(<Object>[
      id,
      name,
      appearsIn,
      homePlanet,
      height,
      mass,
      friends,
      starships,
      createdAt,
      updatedAt
    ]);
  }

  @override
  String toString() {
    return "Human(id=$id, name=$name, appearsIn=$appearsIn, homePlanet=$homePlanet, height=$height, mass=$mass, friends=$friends, starships=$starships, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return HumanSerializer.toMap(this);
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

    return <String, Object>{
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

    if (map['appearsIn'] == null) {
      throw FormatException("Missing required field 'appearsIn' on Droid.");
    }

    return Droid(
        id: map['id'] as String,
        name: map['name'] as String,
        friends: map['friends'] is Iterable
            ? (map['friends'] as Iterable).cast<Character>().toList()
            : null,
        appearsIn: map['appearsIn'] is Iterable
            ? (map['appearsIn'] as Iterable).cast<Episode>().toList()
            : null,
        primaryFunction: map['primaryFunction'] as String,
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
      throw FormatException("Missing required field 'appearsIn' on Droid.");
    }

    return <String, Object>{
      'id': model.id,
      'name': model.name,
      'friends': model.friends,
      'appearsIn': model.appearsIn,
      'primaryFunction': model.primaryFunction,
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

  static const String appearsIn = 'appearsIn';

  static const String primaryFunction = 'primaryFunction';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

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

    if (map['appearsIn'] == null) {
      throw FormatException("Missing required field 'appearsIn' on Human.");
    }

    if (map['height'] == null) {
      throw FormatException("Missing required field 'height' on Human.");
    }

    return Human(
        id: map['id'] as String,
        name: map['name'] as String,
        appearsIn: map['appearsIn'] is Iterable
            ? (map['appearsIn'] as Iterable).cast<Episode>().toList()
            : null,
        homePlanet: map['homePlanet'] as String,
        height: map['height'] as double,
        mass: map['mass'] as double,
        friends: map['friends'] is Iterable
            ? (map['friends'] as Iterable).cast<Character>().toList()
            : null,
        starships: map['starships'] is Iterable
            ? (map['starships'] as Iterable).cast<Starship>().toList()
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
      throw FormatException("Missing required field 'appearsIn' on Human.");
    }

    if (model.height == null) {
      throw FormatException("Missing required field 'height' on Human.");
    }

    return <String, Object>{
      'id': model.id,
      'name': model.name,
      'appearsIn': model.appearsIn,
      'homePlanet': model.homePlanet,
      'height': model.height,
      'mass': model.mass,
      'friends': model.friends,
      'starships': model.starships,
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
    height,
    mass,
    friends,
    starships,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String name = 'name';

  static const String appearsIn = 'appearsIn';

  static const String homePlanet = 'homePlanet';

  static const String height = 'height';

  static const String mass = 'mass';

  static const String friends = 'friends';

  static const String starships = 'starships';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

@generatedSerializable
class Review extends _Review {
  Review(
      {this.id,
      @required this.episode,
      @required this.stars,
      this.commentary,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final Episode episode;

  @override
  final int stars;

  @override
  final String commentary;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Review copyWith(
      {String id,
      Episode episode,
      int stars,
      String commentary,
      DateTime createdAt,
      DateTime updatedAt}) {
    return Review(
        id: id ?? this.id,
        episode: episode ?? this.episode,
        stars: stars ?? this.stars,
        commentary: commentary ?? this.commentary,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  @override
  bool operator ==(Object other) {
    return other is _Review &&
        other.id == id &&
        other.episode == episode &&
        other.stars == stars &&
        other.commentary == commentary &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects(
        <Object>[id, episode, stars, commentary, createdAt, updatedAt]);
  }

  @override
  String toString() {
    return "Review(id=$id, episode=$episode, stars=$stars, commentary=$commentary, createdAt=$createdAt, updatedAt=$updatedAt)";
  }

  Map<String, dynamic> toJson() {
    return ReviewSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

const ReviewSerializer reviewSerializer = ReviewSerializer();

class ReviewEncoder extends Converter<Review, Map> {
  const ReviewEncoder();

  @override
  Map convert(Review model) => ReviewSerializer.toMap(model);
}

class ReviewDecoder extends Converter<Map, Review> {
  const ReviewDecoder();

  @override
  Review convert(Map map) => ReviewSerializer.fromMap(map);
}

class ReviewSerializer extends Codec<Review, Map> {
  const ReviewSerializer();

  @override
  get encoder => const ReviewEncoder();
  @override
  get decoder => const ReviewDecoder();
  static Review fromMap(Map map) {
    if (map['episode'] == null) {
      throw FormatException("Missing required field 'episode' on Review.");
    }

    if (map['stars'] == null) {
      throw FormatException("Missing required field 'stars' on Review.");
    }

    return Review(
        id: map['id'] as String,
        episode: map['episode'] is Episode
            ? (map['episode'] as Episode)
            : (map['episode'] is int
                ? episodeFromJson(map['episode'] as String)
                : null),
        stars: map['stars'] as int,
        commentary: map['commentary'] as String,
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

  static Map<String, dynamic> toMap(_Review model) {
    if (model == null) {
      return null;
    }
    if (model.episode == null) {
      throw FormatException("Missing required field 'episode' on Review.");
    }

    if (model.stars == null) {
      throw FormatException("Missing required field 'stars' on Review.");
    }

    return <String, Object>{
      'id': model.id,
      'episode': model.episode == null ? null : episodeToJson(model.episode),
      'stars': model.stars,
      'commentary': model.commentary,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class ReviewFields {
  static const List<String> allFields = <String>[
    id,
    episode,
    stars,
    commentary,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String episode = 'episode';

  static const String stars = 'stars';

  static const String commentary = 'commentary';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

// **************************************************************************
// _GraphQLGenerator
// **************************************************************************

/// Auto-generated from [Episode].
final GraphQLEnumType<String> episodeGraphQLType = enumTypeFromStrings(
    'Episode', const ['NEWHOPE', 'EMPIRE', 'JEDI'],
    description: 'The episodes in the Star Wars trilogy');

/// Auto-generated from [Starship].
final GraphQLObjectType starshipGraphQLType =
    objectType('Starship', isInterface: false, interfaces: [], fields: [
  field('id', graphQLString),
  field('name', graphQLString),
  field('length', graphQLFloat),
  field('coordinates', listOf(graphQLFloat)),
  field('created_at', graphQLDate),
  field('updated_at', graphQLDate),
  field('graphql', graphQLString),
  field('idAsInt', graphQLInt)
]);

/// Auto-generated from [Droid].
final GraphQLObjectType droidGraphQLType =
    objectType('Droid', isInterface: false, interfaces: [
  characterGraphQLType
], fields: [
  field('id', graphQLString),
  field('name', graphQLString),
  field('friends', listOf(characterGraphQLType)),
  field('appearsIn', listOf(episodeGraphQLType)),
  field('primaryFunction', graphQLString),
  field('created_at', graphQLDate),
  field('updated_at', graphQLDate),
  field('graphql', graphQLString),
  field('idAsInt', graphQLInt)
]);

/// Auto-generated from [Human].
final GraphQLObjectType humanGraphQLType =
    objectType('Human', isInterface: false, interfaces: [
  characterGraphQLType
], fields: [
  field('id', graphQLString),
  field('name', graphQLString),
  field('appearsIn', listOf(episodeGraphQLType)),
  field('homePlanet', graphQLString),
  field('height', graphQLFloat),
  field('mass', graphQLFloat),
  field('friends', listOf(characterGraphQLType)),
  field('starships', listOf(starshipGraphQLType)),
  field('created_at', graphQLDate),
  field('updated_at', graphQLDate),
  field('graphql', graphQLString),
  field('idAsInt', graphQLInt)
]);

/// Auto-generated from [Review].
final GraphQLObjectType reviewGraphQLType =
    objectType('Review', isInterface: false, interfaces: [], fields: [
  field('id', graphQLString),
  field('episode', episodeGraphQLType),
  field('stars', graphQLInt),
  field('commentary', graphQLString),
  field('created_at', graphQLDate),
  field('updated_at', graphQLDate),
  field('graphql', graphQLString),
  field('idAsInt', graphQLInt)
]);

String episodeToJson(Episode e) {
  switch (e) {
    case Episode.NEWHOPE:
      return 'NEWHOPE';
    case Episode.EMPIRE:
      return 'EMPIRE';
    case Episode.JEDI:
      return 'JEDI';
    default:
      return null;
  }
}

Episode episodeFromJson(String e) {
  switch (e) {
    case 'NEWHOPE':
      return Episode.NEWHOPE;
    case 'EMPIRE':
      return Episode.EMPIRE;
    case 'JEDI':
      return Episode.JEDI;
    default:
      return null;
  }
}
