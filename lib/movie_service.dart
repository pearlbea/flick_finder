import 'dart:async';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import 'app_config.dart';
import 'model/genre_list.dart';
import 'model/movies.dart';

const String baseImagePath = 'https://image.tmdb.org/t/p/';
const String baseUrl = 'https://api.themoviedb.org/3';
const String posterSize = 'w154';
const String backdropSize = 'w780';

class MovieService {
  Future<String> apiKey;
  Future<GenreList> genreList;
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
    print(genre.id);

    movieList = loadAPIkey()
        .then((String apiKey) => constructUrl(
            apiKey: apiKey, path: 'discover/movie', genreId: genre.id))
        .then((String url) => http.get(url))
        .then((http.Response response) => moviesFromJson(response.body));

    return movieList;
  }
}
