import 'package:flutter/material.dart';
import 'package:happy/components/createOrphanage/create.dart';
import 'package:happy/components/map/map.dart';
import 'package:happy/services/image.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return HomeMap();
  }
}

class HomeMap extends StatelessWidget {
  const HomeMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Stack(
        children: [
          Map(
            onTapMap: (latlng) {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
    return scaffold;
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Center(
              widthFactor: 2,
              child: Text(
                "2 Encontrados",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey, fontFamily: 'Nunito', fontSize: 20),
              ),
            )),
        Positioned(
          right: 0,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateOrphanage()));
            },
            color: Color(0xFF2AB5D1),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Color(0xFF2AB5D1))),
          ),
        )
      ],
    );
  }
}
