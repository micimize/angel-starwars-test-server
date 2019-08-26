import 'dart:async';
import 'dart:math';

import 'src/models.dart';

class _ReviewDirectory {
  int pageLength = 10;

  List<List<Review>> pages = [[]];

  _ReviewDirectory({int initialPages = 0}) {
    List<Review>.generate(initialPages * pageLength, addRandomReview);
  }

  List<Review> get currentPage => pages.last;

  List<Review> page(int index) {
    if (index < pages.length) {
      return pages[index];
    }

    return [];
  }

  Iterable<Map<String, dynamic>> pageAsJson(int pageIndex) =>
      page(pageIndex).map<Map<String, dynamic>>((r) => r.toJson());

  void add(Review review) {
    if (currentPage.length >= pageLength) {
      return pages.add([review]);
    }
    currentPage.add(review);
  }

  Review addRandomReview(int tick) {
    final rating = 1 + _random.nextInt(4);
    final review = Review(
      id: nextId(),
      episode: choice(Episode.values),
      stars: rating,
      commentary: choice(genericReviews[rating]),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    add(review);
    return review;
  }
}

final directory = _ReviewDirectory(initialPages: 10);

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

Stream<Review> randomReviewStream(
        {Duration period = const Duration(seconds: 10)}) =>
    Stream.periodic(period, directory.addRandomReview);
