import 'package:flutter/material.dart';
import 'model/movies.dart';
import 'model/movie.dart';

class HomePage extends StatelessWidget {
  List<Card> _buildGridCards(BuildContext context) {
    List<Movie> movies = Movies.loadMovies();

    if (movies == null || movies.isEmpty) {
      return const <Card>[];
    }

    return movies.map((movie) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text(movie.title)]),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('flick finder'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          children: _buildGridCards(context),
        ));
  }
}
