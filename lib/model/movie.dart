import 'package:flutter/foundation.dart';

class Movie {
  const Movie({
    @required this.id,
    @required this.title,
  })  : assert(id != null),
        assert(title != null);

  final int id;
  final String title;
}
