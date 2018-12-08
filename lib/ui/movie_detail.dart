import 'package:flutter/material.dart';
import '../movie_service.dart';
import 'star_button.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail(this.movie);
  final dynamic movie;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                    MovieService().getBackdropPath(movie.backdropPath),
                  ),
                ),
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(movie.title, style: theme.textTheme.headline),
                            Text(movie.releaseDate.split('-')[0],
                                style: theme.textTheme.caption),
                          ],
                        ),
                      ),
                      StarButton(),
                    ],
                  ),
                ),
              ),
            ]),
            Row(children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(movie.overview,
                      style: const TextStyle(height: 1.2, fontSize: 18.0)),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}

// SizedBox(
//   child: Hero(
//     tag: movie.title,
//     child:
//         Image.network(MovieService().getPosterPath(movie.posterPath)),
//   ),
// )
