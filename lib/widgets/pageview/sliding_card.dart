import 'package:flutter/material.dart';
import 'dart:math' as math;

class SlidingCard extends StatelessWidget {
  final String _name;
  final String _date;
  final String _assetName;
  final double _offset;

  const SlidingCard(
      {@required name,
      @required date,
      @required assetName,
      Key key,
      @required double offset})
      : _name = name,
        _date = date,
        _assetName = assetName,
        _offset = offset,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((_offset.abs() - 0.5), 2) /
        0.08)); //<--caluclate Gaussian function

    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            child: Image.asset(
              'assets/images/$_assetName',
              height: MediaQuery.of(context).size.height * 0.3,
              alignment: Alignment(-_offset.abs(), 0),
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
              child: Transform.translate(
            offset: Offset(-32 * gauss * _offset.sign, 0),
            child: _CardContent(
              date: _date,
              name: _name,
              key: key,
              offset: gauss,
            ),
          ))
        ],
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final String _name;
  final String _date;
  final double _offset;

  const _CardContent(
      {Key key, @required name, @required date, @required offset})
      : _name = name,
        _date = date,
        _offset = offset,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(8 * _offset, 0),
            child: Text(
              _name,
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Transform.translate(
            offset: Offset(32 * _offset, 0),
            child: Text(
              _date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Transform.translate(
                offset: Offset(48 * _offset, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Reserve"),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32)),
                      primary: Color(0xFF162A49),
                      textStyle: TextStyle(fontSize: 12, color: Colors.white)),
                ),
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(32 * _offset, 0),
                child: Text(
                  "0.00\$",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          )
        ],
      ),
    );
  }
}
