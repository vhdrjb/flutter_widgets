import 'package:flutter/material.dart';
import 'package:flutter_widgets_intro/widgets/expanded/post_widget.dart';

class ExpandedSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Expanded sample"),
      ),
      body: Container(
        color: Colors.pink,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Expanded widget is used at title of card to expand title and subtitle",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),),
            ),
            PostWidget(),
          ],
        ),
      ),
    );
  }
}
