import 'package:flutter/material.dart';

class StarButton extends StatefulWidget {
  @override
  _StarButtonState createState() => _StarButtonState();
}

class _StarButtonState extends State {
  bool _isSelected = false;

  void _toggleSelected() {
    setState(() {
      _isSelected = _isSelected ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        color: Colors.red,
        icon: _isSelected
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
        iconSize: 34,
        onPressed: _toggleSelected,
        tooltip: 'Add to watchlist',
      ),
    );
  }
}
