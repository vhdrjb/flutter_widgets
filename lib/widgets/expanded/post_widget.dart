import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  static const String _profileAvatarUrl =
      "https://randomuser.me/api/portraits/men/62.jpg";
  static const String _imageUrl =
      "https://images.ctfassets.net/hrltx12pl8hq/5GaLeZJlLyOiQC4gOA0qUM/a0398c237e9744ade8b072f99349e07a/shutterstock_152461202_thumb.jpg?fit=fill&w=368&h=207";

  static const String _userFullName = "Alex Statnton";
  static const String _userLocation = "Poland";
  static const _profileAvatarSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
          elevation: 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: _userInfoRow(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: _image(context),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 8, 32, 16),
                child: _actions(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _userInfoRow() {
    return Row(
      children: [_profileAvatar(), _userInfo(), _options()],
    );
  }

  Widget _profileAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(_profileAvatarSize)),
      child: Image.network(
        _profileAvatarUrl,
        height: _profileAvatarSize,
        width: _profileAvatarSize,
      ),
    );
  }

  Widget _userInfo() {
    return Expanded(
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            _userFullName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text(_userLocation),
      ),
    );
  }

  Widget _options() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: Colors.black),
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.more_horiz),
      ),
    );
  }

  Widget _image(BuildContext context) {
    return AspectRatio(
        aspectRatio: 3 / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            _imageUrl,
            fit: BoxFit.fill,
          ),
        ));
  }

  Widget _actions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: [
        _like(),
        Padding(
          padding: const EdgeInsets.only(left :4.0),
          child: _comments(),
        ),
        Padding(
          padding: const EdgeInsets.only(left :4.0),
          child: _share(),
        ),
        Spacer(flex: 1,),
        _bookmark(),
      ],
    );
  }

  Widget _like() {
    return Row(
      children: [
        Icon(Icons.favorite_border),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text("7.8k"),
        )
      ],
    );
  }

  Widget _comments() {
    return Row(
      children: [
        Icon(Icons.chat_bubble_outline),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text("142"),
        )
      ],
    );
  }

  Widget _share() {
    return Row(
      children: [
        Icon(Icons.eco),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text("142"),
        )
      ],
    );
  }

  Widget _bookmark() {
    return Row(
      children: [
        Icon(Icons.turned_in_not),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text("142"),
        )
      ],
    );
  }
}
