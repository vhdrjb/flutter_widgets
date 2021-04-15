import 'package:flutter/material.dart';

import 'travel_blog_appbar.dart';

class SliverAppBarSample extends StatelessWidget {
  static const double _imageMaxHeight = 500;
  static const String _slidingImagesUrl = "https://picsum.photos/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TravelBlogAppbar(),
      backgroundColor: Colors.white,
      body: _buildWidgets(context),
    );
  }

  Column _buildWidgets(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        Expanded(child: _buildSlidingView(),flex: 2,)
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
      child: Text(
        "Travel Blog",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSlidingView() {
    return Placeholder();

  }

}
