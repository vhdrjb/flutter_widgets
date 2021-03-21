import 'package:flutter/material.dart';
import 'package:flutter_widgets_intro/widgets/pageview/page_view_sample.dart';

import 'animated_bottom_sheet.dart';

class AnimatedBuilderSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          SafeArea(
            child: _Home(
              child: SlidingCardView(),
            ),
          ),
          AnimatedBottomSheet()
        ],
      ),
    );
  }
}

class _Home extends StatelessWidget {
  final Widget widget;

  _Home({Widget child, Key key})
      : widget = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(
            "Animated Builder Sample",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.grey
          ),
        ),
        widget
      ],
    );
  }
}
