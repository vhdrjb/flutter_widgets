import 'package:flutter/material.dart';
import 'package:flutter_widgets_intro/widgets/pageview/sliding_card.dart';
import '../animated_builder/event.dart';

class PageViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shenzhen",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.grey),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: SlidingCardView()),
        ),
      ),
    );
  }
}

class SlidingCardView extends StatefulWidget {
  @override
  _SlidingCardViewState createState() => _SlidingCardViewState();
}

class _SlidingCardViewState extends State<SlidingCardView> {
  PageController _pageController;
  double _pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    _pageController.addListener(() {
      setState(() {
        _pageOffset = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.55,
      child: PageView(
        controller: _pageController,
        children: children(),
      ),
    );
  }

  List<Widget> children() {
    return List.generate(events.length, (index) =>
        SlidingCard(name: events[index].title,
            date: events[index].date,
            assetName: events[index].assetName,
            offset: _pageOffset - index)
    );
  }
}
