import 'package:flutter/material.dart';

import 'widgets/animated_builder/animated_builder_sample.dart';
import 'widgets/animated_container/animated_container_sample.dart';
import 'widgets/fade_transition/fade_transition_sample.dart';
import 'widgets/opacity/opacity_sample.dart';
import 'widgets/pageview/page_view_sample.dart';
import 'widgets/wrap/wrap_sample.dart';
import 'widgets/expanded/expanded_sample.dart';
import 'widgets/safearea/safe_area_sample.dart';

void main() {
  runApp(FlutterWidgets());
}

class FlutterWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/safe_area": (context) => SafeAreaSample(),
        "/expanded": (context) => ExpandedSample(),
        "/wrap": (context) => WrapSample(),
        "/animated_container": (context) => AnimatedContainerSample(),
        "/opacity": (context) => OpacitySample(),
        "/fade_transition": (context) => FadeTransitionSample(),
        "/pageview": (context) => PageViewSample(),
        "/animated_builder": (context) => AnimatedBuilderSample(),
      },
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("widgets sample"),
        ),
        body: _widgetList(),
      ),
    );
  }

  Widget _widgetList() {
    final List<Map<String, String>> items = [
      {
        "safe area":
            "A widget that insets its child by sufficient padding to avoid intrusions by the operating system."
      },
      {
        "Expanded":
            "Using an Expanded widget makes a child of a Row, Column, or Flex expand to fill the available space along the main axis (e.g., horizontally for a Row or vertically for a Column). If multiple children are expanded, the available space is divided among them according to the flex factor."
      },
      {
        "Wrap":
            "A Wrap lays out each child and attempts to place the child adjacent to the previous child in the main axis, given by direction, leaving spacing space in between. If there is not enough space to fit the child, Wrap creates a new run adjacent to the existing children in the cross axis."
      },
      {
        "Animated Container":
            "The AnimatedContainer will automatically animate between the old and new values of properties when they change using the provided curve and duration. Properties that are null are not animated. Its child and descendants are not animated"
      },
      {
        "Opacity":
            "This class paints its child into an intermediate buffer and then blends the child back into the scene partially transparent."
      },
      {
        "Fade Transition":
            "For a widget that automatically animates between the sizes of two children, fading between them"
      },
      {
        "PageView": "A scrollable list that works page by page.",
      },
      {
        "Animated Builder":
            "AnimatedBuilder is useful for more complex widgets that wish to include an animation as part of a larger build function. To use AnimatedBuilder, simply construct the widget and pass it a builder function."
      }
    ].reversed.toList();
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final String title = items[index].keys.first;
        final String description = items[index].values.first;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(description),
              ),
              onTap: () => Navigator.pushNamed(
                  context, "/${title.toLowerCase().replaceAll(" ", "_")}"),
            ),
          ),
        );
      },
    );
  }
}
