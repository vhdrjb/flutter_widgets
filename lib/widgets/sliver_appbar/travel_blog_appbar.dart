import 'package:flutter/material.dart';

class TravelBlogAppbar extends AppBar {
  @override
  double get elevation => 0;

  @override
  Color get backgroundColor => Colors.white;

  @override
  IconThemeData get actionsIconTheme => _actionTheme();

  @override
  List<Widget> get actions => [_buildDrawerIcon()];

  Widget _buildDrawerIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Icon(Icons.menu),
    );
  }

  IconThemeData _actionTheme() {
    return IconThemeData(
      color: Colors.black
    );
  }
}
