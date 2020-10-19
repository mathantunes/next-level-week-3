import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({this.text, Key key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(this.text,
          style: TextStyle(color: Colors.black, fontFamily: 'NunitoBlack')),
    );
  }
}
