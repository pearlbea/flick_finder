import 'package:flutter/material.dart';
import 'package:flick_finder/ui/genre_grid.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flick finder'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: GenreGrid()),
        ],
      ),
    );
  }
}
