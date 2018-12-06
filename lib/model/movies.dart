import 'dart:convert';

Movies moviesFromJson(String str) {
  final dynamic jsonData = json.decode(str);
  return Movies.fromJson(jsonData);
}

class Movies {
  Movies({
    this.page,
    this.totalResults,
    this.totalPages,
    this.results,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        page: json['page'],
        totalResults: json['total_results'],
        totalPages: json['total_pages'],
        results: List<Result>.from(
            json['results'].map((dynamic x) => Result.fromJson(x))),
      );

  int page;
  int totalResults;
  int totalPages;
  List<Result> results;
}

class Result {
  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  OriginalLanguage originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Result({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        voteCount: json['vote_count'],
        id: json['id'],
        video: json['video'],
        voteAverage: json['vote_average'].toDouble(),
        title: json['title'],
        popularity: json['popularity'].toDouble(),
        posterPath: json['poster_path'],
        originalLanguage: originalLanguageValues.map[json['original_language']],
        originalTitle: json['original_title'],
        genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
        backdropPath: json['backdrop_path'],
        adult: json['adult'],
        overview: json['overview'],
        releaseDate: json['release_date'],
      );
}

enum OriginalLanguage { EN }

final originalLanguageValues = EnumValues({'en': OriginalLanguage.EN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => MapEntry(v, k));
    }
    return reverseMap;
  }
}
