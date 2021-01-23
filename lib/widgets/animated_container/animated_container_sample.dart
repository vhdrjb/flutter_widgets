import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedContainerSample extends StatefulWidget {
  @override
  AnimatedContainerState createState() => AnimatedContainerState();
}

class AnimatedContainerState extends State<AnimatedContainerSample> {
  AlignmentGeometry _circleAlignment = Alignment.center;
  Color _backgroundColor = Colors.yellowAccent;
  double _size = 100.0;
  BorderRadius _borderRadius = BorderRadius.circular(10);
  double _padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container Sample"),
      ),
      body: Center(
        child: Container(
          child: _buildWidgets(),
        ),
      ),
    );
  }

  Widget _buildWidgets() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _circleAlignment = (_circleAlignment == Alignment(0.0, -0.8)
              ? Alignment(0, 0)
              : Alignment(0.0, -0.8));
          _backgroundColor = Color.fromARGB(
              Random().nextInt(255),
              Random().nextInt(255),
              Random().nextInt(255),
              Random().nextInt(255));

          _size = Random().nextDouble() * 100 + 100;
          _borderRadius =
              BorderRadius.circular(Random().nextInt(_size.toInt()) / 2);
        });
      },
      child: AnimatedAlign(
        duration: Duration(seconds: 3),
        alignment: _circleAlignment,
        curve: Curves.easeOutQuad,
        child: AnimatedContainer(
          padding: EdgeInsets.all(_padding),
          duration: Duration(seconds: 1),
          height: _size,
          width: _size,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            color: _backgroundColor,
          ),
          child: Center(
            child: Text("Click me"),
          ),
        ),
      ),
    );
  }
}
