import 'package:flutter/material.dart';

import 'home.dart';

class FlickFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flick Finder',
      home: HomePage(),
      initialRoute: '/home',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/home') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => HomePage(),
      fullscreenDialog: true,
    );
  }
}
