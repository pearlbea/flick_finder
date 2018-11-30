import 'package:flutter/material.dart';
import '../movie_service.dart';
import '../ui/movie_detail.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie);

  final dynamic movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            Image.network(MovieService.getPosterPath(movie.posterPath)),
            Container(
              child: Text(
                movie.title,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
            ),
          ],
        ),
      ),
    );
  }
}
