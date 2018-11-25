import 'package:flutter/foundation.dart';

class Movie {
  const Movie({
    @required this.id,
    @required this.title,
    this.poster,
  })  : assert(id != null),
        assert(title != null);

  final int id;
  final String title;
  final String poster;
}
