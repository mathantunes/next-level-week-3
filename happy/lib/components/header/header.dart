import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({this.text, Key key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontFamily: 'NunitoBlack'),
        ),
      ),
    );
  }
}
