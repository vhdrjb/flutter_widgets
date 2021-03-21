import 'package:flutter/material.dart';

class SheetHeader extends StatelessWidget {
  final double _fontSize;
  final double _topMargin;

  SheetHeader({@required fontSize, @required topMargin, Key key})
      : _fontSize = fontSize,
        _topMargin = topMargin,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _topMargin,
      child: Text("Booked Exhibition",
      style: TextStyle(
        color: Colors.white,
        fontSize: _fontSize,
        fontWeight: FontWeight.w500
      ),),
    );
  }
}
