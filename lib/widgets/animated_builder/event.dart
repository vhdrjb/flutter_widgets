import 'package:flutter/cupertino.dart';

class Event {
  final String _assetName;
  final String _title;
  final String _date;

  Event({@required assetName, @required title, @required date})
      : _assetName = assetName,
        _title = title,
        _date = date;

  String get assetName => _assetName;

  String get title => _title;

  String get date => _date;
}

final List<Event> events = [
  Event(
      assetName: "steve-johnson.jpg",
      title: "Shenzhen GLOBAL DESIGN AWARD 2018",
      date: "4.20-30"),
  Event(
      title: "Dawan District, Guangdong Hong Kong and Macao",
      date: "4.28-31",
      assetName: "rodion-kutsaev.jpg"),
  Event(
      title: "Shenzhen GLOBAL DESIGN AWARD 2018",
      date: "4.20-30",
      assetName: "efe-kurnaz.jpg"),

];
