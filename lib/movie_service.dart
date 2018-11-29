import 'dart:async';
import 'package:http/http.dart' as http;

import 'app_config.dart';
import 'model/movies.dart';

const String basePosterPath = 'https://image.tmdb.org/t/p/';
const String baseUrl = 'https://api.themoviedb.org/3';
const String size = 'w154';

// TODO store results in a variable to avoid repeat calls

String constructUrl(String apiKey) {
  return '$baseUrl/discover/movie?api_key=$apiKey';
}

String getPosterPath(String posterId) {
  return '$basePosterPath$size/$posterId';
}

Future<Movies> getMovies() async {
  return getApiKey()
      .then((String apiKey) => constructUrl(apiKey))
      .then((String url) => http.get(url))
      .then((dynamic response) => moviesFromJson(response.body));
}
