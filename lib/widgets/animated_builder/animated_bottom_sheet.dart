import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_intro/widgets/animated_builder/expanded_event_item.dart';
import 'dart:math' as math;

import 'package:flutter_widgets_intro/widgets/animated_builder/sheet_header.dart';

import 'event.dart';

class AnimatedBottomSheet extends StatefulWidget {
  @override
  _AnimatedBottomSheetState createState() => _AnimatedBottomSheetState();
}

class _AnimatedBottomSheetState extends State<AnimatedBottomSheet>
    with TickerProviderStateMixin {
  static const double _minHeight = 120;
  static const double iconBeginSize = 44;
  static const double iconEndSize = 100;
  static const double iconBeginTopMargin = 50;
  static const double iconEndTopMargin = 80;
  static const double iconVerticalSpacing = 24;
  static const double iconHorizontalSpacing = 16;

  AnimationController _animationController;

  // lerp : https://en.wikipedia.org/wiki/Linear_interpolation
  double calculateLerp(double min, double max) =>
      lerpDouble(min, max, _animationController.value);

  double get maxHeight =>
      MediaQuery
          .of(context)
          .size
          .height + 32;

  double get headerFontSize => calculateLerp(14, 24);

  double get headerTopMargin =>
      calculateLerp(20, 20 + MediaQuery
          .of(context)
          .padding
          .top + 32);

  double get iconSize => calculateLerp(iconBeginSize, iconEndSize);

  double iconTopMargin(int index) =>
      calculateLerp(
          iconBeginTopMargin,
          iconEndTopMargin +
              (index * (iconVerticalSpacing + iconEndSize) + headerTopMargin));

  double iconLeftMargin(int index) =>
      calculateLerp(index * (iconHorizontalSpacing + iconBeginSize), 0);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Positioned(
          height: calculateLerp(_minHeight, maxHeight),
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            decoration: const BoxDecoration(
                color: Color(0xFF162A49),
                borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
            child: GestureDetector(
              onTap: _toggle,
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    _MenuButton(),
                    SheetHeader(
                        fontSize: headerFontSize, topMargin: headerTopMargin),
                    for (Event event in events) _buildEvent(event),
                    for (Event event in events) _buildIcons(event)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _toggle() {
    final bool isOpen =
        _animationController.status == AnimationStatus.completed;
    _animationController.fling(velocity: isOpen ? -2 : 2);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _animationController.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_animationController.isAnimating ||
        _animationController.status == AnimationStatus.completed) {
      return;
    }

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;

    if (flingVelocity < 0.0) {
      _animationController.fling(velocity: math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _animationController.fling(velocity: math.min(-2.0, -flingVelocity));
    } else {
      _animationController.fling(
          velocity: _animationController.value < 0.5 ? -2.0 : 2.0);
    }
  }

  _buildIcons(Event event) {
    int index = events.indexOf(event);
    return Positioned(
        height: iconSize,
        width: iconSize,
        top: iconTopMargin(index),
        left: iconLeftMargin(index),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/${event.assetName}",
            fit: BoxFit.cover,
            alignment: Alignment(calculateLerp(1, 0), 0),
          ),
        ));
  }

  _buildEvent(Event event) {
    int index = events.indexOf(event);
    return ExpandedEventItem(topMargin: iconTopMargin(index),
        leftMargin: iconLeftMargin(index),
        height: iconSize,
        visible: _animationController.status == AnimationStatus.completed,
        title: event.title,
        date: event.date);
  }
}

class _MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 24,
      child: Icon(
        Icons.menu,
        color: Colors.white,
      ),
    );
  }
}
