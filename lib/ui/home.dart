import 'package:flutter/material.dart';
import 'package:flick_finder/model/movies.dart';
import 'package:flick_finder/movie_service.dart';
import 'package:flick_finder/ui/movie_card.dart';

class HomePage extends StatelessWidget {
  List<Widget> _buildGridCards(
      BuildContext context, AsyncSnapshot<Movies> snapshot) {
    final List<Result> movies = snapshot.data.results;

    return movies.map((Result movie) {
      return MovieCard(movie);
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
      body: FutureBuilder<Movies>(
          future: MovieService.getMovies(),
          builder: (BuildContext context, AsyncSnapshot<Movies> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('none..');
              case ConnectionState.waiting:
                return const Text('waiting...');
              default:
                if (snapshot.hasError) {
                  return Text('error: $snapshot.error');
                } else {
                  return GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: itemWidth / itemHeight,
                    padding: const EdgeInsets.all(12.0),
                    children: _buildGridCards(context, snapshot),
                  );
                }
            }
          }),
    );
  }
}
