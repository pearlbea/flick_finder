import 'package:flutter/material.dart';
import '../movie_service.dart';
import '../ui/movie_detail.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie);

  final dynamic movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push<dynamic>(
            MaterialPageRoute<dynamic>(builder: (BuildContext context) {
          return MovieDetail(movie);
        }));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: movie.title,
              child:
                  Image.network(MovieService().getPosterPath(movie.posterPath)),
            ),
          ],
        ),
      ),
    );
  }
}
