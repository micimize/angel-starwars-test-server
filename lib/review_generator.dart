import 'dart:async';
import 'dart:math';

import 'src/models.dart';

final _random = new Random();

T choice<T>(List<T> options) => options[_random.nextInt(options.length - 1)];

int _currentId = 0;
String nextId() => (_currentId++).toString();

const genericReviews = <int, List<String>>{
  1: [
    "Never even happened",
    "I hate space",
    ">:-(",
  ],
  2: [
    "Things don't explode in space",
    ":-(",
  ],
  3: [
    "Space wizards: could take em or leave em",
    ":-/",
  ],
  4: [
    "I like the droids. Beep boop!",
    ":-)",
  ],
  5: [
    "I love this movie!!!",
    "Favorite movie ever XD",
  ],
};

Review randomReview(int tick) {
  final rating = 1 + _random.nextInt(4);
  return Review(
    id: nextId(),
    episode: choice(Episode.values),
    stars: rating,
    commentary: choice(genericReviews[rating]),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

Stream<Review> randomReviewStream(
        {Duration period = const Duration(seconds: 10)}) =>
    Stream.periodic(period, randomReview);
