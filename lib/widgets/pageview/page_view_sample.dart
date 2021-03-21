import 'package:flutter/material.dart';
import 'package:flutter_widgets_intro/widgets/pageview/sliding_card.dart';

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
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Center(child: _SlidingCardView()),
        ),
      ),
    );
  }
}

class _SlidingCardView extends StatefulWidget {
  @override
  _SlidingCardViewState createState() => _SlidingCardViewState();
}

class _SlidingCardViewState extends State<_SlidingCardView> {
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
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: _pageController,
        children: [
          SlidingCard(
            name: "Shenzhen GLOBAL DESIGN AWARD 2018",
            date: "4.20-30",
            assetName: "steve-johnson.jpg",
            offset: _pageOffset,
          ),
          SlidingCard(
            name: "Dawan District, Guangdong Hong Kong and Macao",
            date: "4.28-31",
            assetName: "rodion-kutsaev.jpg",
            offset: _pageOffset - 1,
          ),
        ],
      ),
    );
  }
}
