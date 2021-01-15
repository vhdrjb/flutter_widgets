import 'package:flutter/material.dart';
import 'package:flutter_widgets_intro/widgets/safearea/safe_area_sample.dart';

void main() {
  runApp(FlutterWidgets());
}

class FlutterWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/safe_area": (context) => SafeAreaSample(),
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
      }
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final String title = items[index].keys.first;
        final String description = items[index].values.first;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 5,
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
                  context, "/${title.replaceAll(" ", "_")}"),
            ),
          ),
        );
      },
    );
  }
}
