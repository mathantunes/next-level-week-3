import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'components/splash/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                    primarySwatch: Colors.blue, fontFamily: 'NunitoExtraLight'),
                home: Scaffold(
                  body: Splash(
                    city: "São Paulo",
                    state: "São Paulo",
                  ),
                ));
          }
          return Container();
        });
  }
}
