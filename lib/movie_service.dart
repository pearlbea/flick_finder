import 'dart:async';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'app_config.dart';
import 'model/genre_list.dart';
import 'model/movies.dart';

Map<int, Future<Movies>> moviesByGenre = <int, Future<Movies>>{};
Future<GenreList> genreList;

class MovieService {
  static const String baseImagePath = 'https://image.tmdb.org/t/p/';
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String posterSize = 'w154';
  static const String backdropSize = 'w780';

  Future<String> apiKey;
  Future<Movies> movieList;

  String constructUrl(
      {@required String apiKey, @required String path, int genreId}) {
    if (genreId != null) {
      return '$baseUrl/$path?api_key=$apiKey&with_genres=$genreId';
    }
    return '$baseUrl/$path?api_key=$apiKey';
  }

  Future<String> loadAPIkey() async {
    if (apiKey != null) {
      return apiKey;
    }
    return getApiKey();
  }

  String getPosterPath(String posterId) {
    return '$baseImagePath$posterSize/$posterId';
  }

  String getBackdropPath(String imageId) {
    return '$baseImagePath$backdropSize/$imageId';
  }

  Future<GenreList> getGenreList() async {
    if (genreList != null) {
      return genreList;
    }

    genreList = loadAPIkey()
        .then((String apiKey) {
          return constructUrl(apiKey: apiKey, path: 'genre/movie/list');
        })
        .then((String url) => http.get(url))
        .then((http.Response response) => genreListFromJson(response.body));

    return genreList;
  }

  Future<Movies> getMovies(Genre genre) async {
    if (moviesByGenre[genre.id] != null) {
      return moviesByGenre[genre.id];
    }

    final String apiKey = await loadAPIkey();
    final String url =
        constructUrl(apiKey: apiKey, path: 'discover/movie', genreId: genre.id);

    movieList = http
        .get(url)
        .then((http.Response response) => moviesFromJson(response.body));

    moviesByGenre[genre.id] = movieList;

    return movieList;
  }
}
