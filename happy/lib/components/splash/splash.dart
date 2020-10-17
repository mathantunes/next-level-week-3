import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  Splash({Key key, this.state, this.city}) : super(key: key);
  final String state;
  final String city;
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SplashScreen(
          seconds: 3,
          gradientBackground: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2AB5D1), Color(0xFF00C7C7)],
          ),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('Logotipo.png'),
                  fit: BoxFit.none,
                  scale: 1.2)),
        ),
        Positioned(
          bottom: 130,
          child: Text(
            this.city,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NunitoSemiBold',
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          child: Container(
            child: Text(
              this.state,
              style: TextStyle(
                fontFamily: 'NunitoLight',
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
