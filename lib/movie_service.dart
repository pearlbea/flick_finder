import 'dart:async';
import 'package:http/http.dart' as http;

import 'app_config.dart';
import 'model/movies.dart';

const String baseImagePath = 'https://image.tmdb.org/t/p/';
const String baseUrl = 'https://api.themoviedb.org/3';
const String posterSize = 'w154';
const String backdropSize = 'w780';

class MovieService {
  Future<Movies> movieList;

  String constructUrl(String apiKey) {
    return '$baseUrl/discover/movie?api_key=$apiKey';
  }

  String getPosterPath(String posterId) {
    return '$baseImagePath$posterSize/$posterId';
  }

  String getBackdropPath(String imageId) {
    return '$baseImagePath$backdropSize/$imageId';
  }

  Future<Movies> getMovies() async {
    if (movieList != null) {
      return movieList;
    }

    movieList = getApiKey()
        .then((String apiKey) => constructUrl(apiKey))
        .then((String url) => http.get(url))
        .then((http.Response response) => moviesFromJson(response.body));

    return movieList;
  }
}
