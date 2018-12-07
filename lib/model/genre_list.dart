import 'dart:convert';

GenreList genreListFromJson(String str) {
  final dynamic jsonData = json.decode(str);
  return GenreList.fromJson(jsonData);
}

class GenreList {
  GenreList({
    this.genres,
  });

  factory GenreList.fromJson(Map<String, dynamic> json) => GenreList(
        genres: List<Genre>.from(
            json['genres'].map((dynamic x) => Genre.fromJson(x))),
      );

  List<Genre> genres;
}

class Genre {
  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'],
        name: json['name'],
      );

  int id;
  String name;
}
