import 'package:flutter/material.dart';
import 'package:flick_finder/model/movies.dart';
import 'package:flick_finder/movie_service.dart';
import 'package:flick_finder/ui/movie_card.dart';

class HomePage extends StatelessWidget {
  final Future<Movies> movieList = MovieService().getMovies();

  List<Widget> _buildGridCards(BuildContext context, Movies movies) {
    return movies.results.map((Result movie) {
      return MovieCard(movie);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 2;
    final double itemWidth = size.width / 1.36;

    return Scaffold(
      appBar: AppBar(
        title: const Text('flick finder'),
      ),
      body: FutureBuilder<Movies>(
          future: movieList,
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
                    children: _buildGridCards(context, snapshot.data),
                  );
                }
            }
          }),
    );
  }
}
