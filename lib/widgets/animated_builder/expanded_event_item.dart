import 'package:flutter/material.dart';

class ExpandedEventItem extends StatelessWidget {
  final double _topMargin;
  final double _leftMargin;
  final double _height;
  final bool _visible;
  final double _borderRadius ;
  final String _title;
  final String _date;

  ExpandedEventItem(
      {@required topMargin,
      @required leftMargin,
      @required height,
      @required visible,
      borderRadius = 15.0,
      @required title,
      @required date,
      Key key})
      : _topMargin = topMargin,
        _leftMargin = leftMargin,
        _height = height,
        _visible = visible,
        _borderRadius = borderRadius ,
        _title = title,
        _date = date,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _topMargin,
      left: _leftMargin,
      right: 0,
      height: _height,
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 150),
        child: Container(
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(_borderRadius),
            color: Colors.white
          ),
          padding: EdgeInsets.only(left: _height).add(EdgeInsets.all(8)),
          child: _buildContent(),
        ),
      ),
    );
  }

  _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_title,style: TextStyle(fontSize: 12),),
        SizedBox(height: 10,),
        Row(
          children: [
            Text("1 Ticket",style: TextStyle(color: Colors.black54,fontSize: 10),),
            SizedBox(width: 10,),
            Text(_date,style: TextStyle(color: Colors.grey,fontSize: 10),),
          ],
        ),
        Spacer(),
        Row(
          children: [
            Icon(Icons.add_location,color: Colors.grey,),
            Text("Location",style: TextStyle(color: Colors.grey),)
          ],
        )
      ],
    );

  }
}
