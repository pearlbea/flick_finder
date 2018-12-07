import 'package:flutter/material.dart';
import 'package:flick_finder/model/genre_list.dart';
import 'package:random_color/random_color.dart';

import '../movie_service.dart';
import 'movie_grid.dart';

class GenreGrid extends StatelessWidget {
  final Future<GenreList> genreList = MovieService().getGenreList();

  Widget _genreCard(BuildContext context, Genre genre) {
    final RandomColor _randomColor = RandomColor();
    final Color _color = _randomColor.randomColor(
        colorBrightness: ColorBrightness.dark,
        colorHue: ColorHue.multiple(colorHues: <ColorHue>[
          ColorHue.blue,
          ColorHue.green,
          ColorHue.purple
        ]));

    return InkWell(
      onTap: () {
        Navigator.of(context).push<dynamic>(
            MaterialPageRoute<dynamic>(builder: (BuildContext context) {
          return MovieGrid(genre);
        }));
      },
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              genre.name,
              softWrap: true,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
        color: _color,
      ),
    );
  }

  List<Widget> _buildGenreCards(BuildContext context, GenreList genreList) {
    return genreList.genres.map((Genre genre) {
      return _genreCard(context, genre);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GenreList>(
      future: genreList,
      builder: (BuildContext context, AsyncSnapshot<GenreList> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('none...');
          case ConnectionState.waiting:
            return const Text('waiting');
          default:
            if (snapshot.hasError) {
              return Text('error: $snapshot.error');
            } else {
              return GridView.count(
                crossAxisCount: 2,
                children: _buildGenreCards(context, snapshot.data),
              );
            }
        }
      },
    );
  }
}
