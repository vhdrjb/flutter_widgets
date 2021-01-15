import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

class ControlButtonClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    return Path()
      ..arcTo(Rect.fromLTWH(0, 0, size.width, size.height), vector.radians(180),
          vector.radians(180), true)
      ..arcTo(
          Rect.fromCenter(
              center: Offset(size.width / 2, size.height + size.height / 8),
              width: size.width * 0.6,
              height: size.height * 0.6),
          vector.radians(315),
          vector.radians(-90),
          false);
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => false;
}
