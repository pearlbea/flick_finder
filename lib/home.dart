import 'package:flutter/material.dart';

import 'model/movie.dart';
import 'model/movies.dart';

class HomePage extends StatelessWidget {
  List<Card> _buildGridCards(BuildContext context) {
    final List<Movie> movies = Movies.loadMovies();

    if (movies == null || movies.isEmpty) {
      return const <Card>[];
    }

    return movies.map((Movie movie) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(movie.poster),
            Container(
              child: Text(
                movie.title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              padding: const EdgeInsets.all(8.0),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          title: const Text('flick finder'),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: itemWidth / itemHeight,
          padding: const EdgeInsets.all(12.0),
          children: _buildGridCards(context),
        ));
  }
}
