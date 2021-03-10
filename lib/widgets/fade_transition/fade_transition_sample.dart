import 'package:flutter/material.dart';

class FadeTransitionSample extends StatefulWidget {
  @override
  _FadeTransitionSampleState createState() => _FadeTransitionSampleState();
}

class _FadeTransitionSampleState extends State<FadeTransitionSample>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();
  }

  _changeControllerVisibilityState() {
    setState(() {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      } else if (_animationController.isDismissed) {
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _buildWidgets(context),
    );
  }

  _buildWidgets(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(),
        _buildToolbar(context),
        _buildActionButtons(),
      ],
    );
  }

  _buildToolbar(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0.0, 0.8),
                colors: [Colors.black, Colors.transparent])),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
            child: Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                  ),
                  onTap: () {
                    if (_animation.isCompleted) {
                      _onBackPress(context);
                    }
                  },
                ),
                Expanded(
                  child: Text(
                    "Video call with Tom Hardy",
                    textAlign: TextAlign.center,
                    style: _titleStyle(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _titleStyle() {
    return TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
  }

  _onBackPress(BuildContext context) {
    return Navigator.of(context).pop();
  }

  _buildBackground() {
    return GestureDetector(
      onTap: () {
        _changeControllerVisibilityState();
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Image.network(
            "https://wallpapercave.com/wp/wp1820224.jpg",
            fit: BoxFit.fitHeight,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

  _buildActionButtons() {
    return Positioned(
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment(0.0, 0.0),
                  colors: [Colors.transparent, Colors.black])),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Icon(Icons.mic),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Icon(Icons.videocam),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    child: Icon(Icons.volume_off),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: 0,
    );
  }
}
