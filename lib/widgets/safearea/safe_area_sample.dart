import 'package:flutter/material.dart';
import 'control_button_clipper.dart';

class SafeAreaSample extends StatefulWidget {
  @override
  SafeAreaState createState() => SafeAreaState();
}

class SafeAreaState extends State<SafeAreaSample> {
  bool topSafeAreaEnabled = false;
  bool rightSafeAreaEnabled = false;
  bool bottomSafeAreaEnabled = false;
  bool leftSafeAreaEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: leftSafeAreaEnabled,
      right: rightSafeAreaEnabled,
      bottom: bottomSafeAreaEnabled,
      top: topSafeAreaEnabled,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.amberAccent[200],title: Text("safe area",style: TextStyle(color: Colors.black),),),
        body: Container(
          color: Colors.amberAccent[200],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _topArrowButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _leftArrowButton(),
                    _resetButton(),
                    _rightArrowButton()
                  ],
                ),
                _bottomArrowButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomArrowButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          bottomSafeAreaEnabled = !bottomSafeAreaEnabled;
        });
      },
      child: RotatedBox(
        child: _arrowButton(() {
          setState(() {
            bottomSafeAreaEnabled = !bottomSafeAreaEnabled;
          });
        }),
        quarterTurns: 2,
      ),
    );
  }

  Widget _rightArrowButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          rightSafeAreaEnabled = !rightSafeAreaEnabled;
        });
      },
      child: RotatedBox(
        child: _arrowButton(() {
          setState(() {
            rightSafeAreaEnabled = !rightSafeAreaEnabled;
          });
        }),
        quarterTurns: 1,
      ),
    );
  }

  Widget _resetButton() {
    return MaterialButton(
      onPressed: () {
        setState(() {
          topSafeAreaEnabled = false;
          bottomSafeAreaEnabled = false;
          leftSafeAreaEnabled = false;
          rightSafeAreaEnabled = false;
        });
      },
      child: Text("reset"),
      color: Colors.grey[200],
      padding: EdgeInsets.all(20),
      shape: CircleBorder(),
    );
  }

  Widget _leftArrowButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          leftSafeAreaEnabled = !leftSafeAreaEnabled;
        });
      },
      child: RotatedBox(
        child: _arrowButton(() {
          setState(() {
            leftSafeAreaEnabled = !leftSafeAreaEnabled;
          });
        }),
        quarterTurns: 3,
      ),
    );
  }

  Widget _topArrowButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          topSafeAreaEnabled = !topSafeAreaEnabled;
        });
      },
      child: _arrowButton(() {
        setState(() {
          topSafeAreaEnabled = !topSafeAreaEnabled;
        });
      }),
    );
  }

  Widget _arrowButton(onPressed) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        SizedBox(
          height: 50,
          width: 100,
          child: ClipPath(
            clipper: ControlButtonClipper(),
            child: RaisedButton(
              color: Colors.grey[200],
              onPressed: onPressed,
            ),
          ),
        ),
        Positioned(
            top: 5,
            child: Icon(
              Icons.keyboard_arrow_up,
              size: 30,
            )),
      ],
    );
  }
}
