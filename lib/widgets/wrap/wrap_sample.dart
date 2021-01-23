import 'package:flutter/material.dart';
import 'package:flutter_widgets_intro/widgets/wrap/tag_model.dart';
import 'package:flutter_widgets_intro/widgets/wrap/tag_widget.dart';
import 'package:tuple/tuple.dart';

class WrapSample extends StatelessWidget {
  static const String _appbarTitle = "Wrap Sample";
  static const String _titleText = "Hashtag Manager";
  static const String _newSetTitle = "New Set";
  static const String _settingsTitle = "Settings";
  static const double _titleTextSize = 25.0;
  static const double _menuIconSize = 20.0;
  static const _cardWidth = 200;
  static const _cardRatio = 3 / 2;

  static List<TagModel> tags = [
    TagModel(
        "Photography Floral",
        "A collection of tags to be used on photos of flowers etc",
        "https://s1.1zoom.me/prev/594/Bouquets_Roses_Dahlias_Closeup_Bokeh_593273_600x400.jpg"),
    TagModel("Photography Abstract", "A collection of tags for abstract photos",
        "https://images.fineartamerica.com/images-medium-large/abstract-flowers-3452011-mario-zampedroni.jpg"),
    TagModel("Tags for cars", "Tags to be used on car images",
        "https://store-images.s-microsoft.com/image/apps.29708.13831084893244954.40597803-8f39-4140-a95f-a188713d31a1.fd343a6e-8100-40ae-85bd-b2b4d6a6dd37?mode=scale&q=90&h=720&w=1280"),
    TagModel("Skies, clouds, sunsets", "skies",
        "https://bloximages.chicago2.vip.townnews.com/tucson.com/content/tncms/assets/v3/editorial/1/bc/1bc9f906-467e-58fa-911e-05e5babe5521/5cc379c3a78f5.image.jpg?resize=1200%2C900"),
    TagModel("Close up", "close up, macros, objects",
        "https://bloximages.chicago2.vip.townnews.com/tucson.com/content/tncms/assets/v3/editorial/1/bc/1bc9f906-467e-58fa-911e-05e5babe5521/5cc379c3a78f5.image.jpg?resize=1200%2C900"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appbarTitle,
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                  "run application on browser and see responsivity on different sizes"),
            ),
            Divider(
              indent: 16,
              endIndent: 16,
              thickness: 2,
            ),
            _tags()
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _titleText,
              style: TextStyle(
                  fontSize: _titleTextSize,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(_menuIconSize),
                  child: Container(
                    color: Colors.green[300],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Icon(Icons.add, color: Colors.lightGreenAccent[200]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    "New Set",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(_menuIconSize),
                  child: Container(
                    color: Colors.grey[500],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.settings, color: Colors.grey[200]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _tags() {
    return Wrap(
      children: List.generate(tags.length, (index) => TagWidget(tags[index])),
    );
  }
}
