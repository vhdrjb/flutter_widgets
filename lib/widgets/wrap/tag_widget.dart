import 'package:flutter/material.dart';

import 'tag_model.dart';

class TagWidget extends StatelessWidget {
  static const _cornerRadius = 20.0;
  static const _maxWidth = 400.0;

  final TagModel _model;

  TagWidget(this._model);

  @override
  Widget build(BuildContext context) {
    return _buildWidgets();
  }

  Widget _buildWidgets() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: BoxConstraints(maxWidth: _maxWidth),
        child: card(),
      ),
    );
  }

  Widget card() {
    return Card(
      shape: _round(),
      color: Colors.black87,
      child: Stack(
        children: [
          _image(),
          _informations(),
        ],
      ),
    );
  }

  Widget _informations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_title(), _description()],
    );
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _model.description,
        style: _descriptionStyle(),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _title() {
    return ClipPath(
      clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(_cornerRadius)))),
      child: Container(
        child: Center(
          child: Container(
            width: double.infinity,
            color: Colors.black38,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                  child: Text(
                _model.title,
                style: _titleTextStyle(),
              )),
            ),
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return ClipPath(
      child: Opacity(
        opacity: 0.3,
        child: AspectRatio(
          aspectRatio: 3 / 2,
          child: Image.network(
            _model.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
      clipper: ShapeBorderClipper(shape: _round()),
    );
  }

  ShapeBorder _round() {
    return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_cornerRadius));
  }

  TextStyle _descriptionStyle() {
    return TextStyle(
        fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white);
  }

  TextStyle _titleTextStyle() {
    return TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600);
  }
}
