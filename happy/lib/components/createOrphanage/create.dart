import 'package:flutter/material.dart';
import 'package:happy/components/map/map.dart';
import 'package:latlong/latlong.dart';

class CreateOrphanage extends StatefulWidget {
  const CreateOrphanage({Key key}) : super(key: key);
  @override
  _CreateOrphanageState createState() => _CreateOrphanageState();
}

class _CreateOrphanageState extends State<CreateOrphanage> {
  LatLng latlng = LatLng(-23.4831788813696, -46.611626642846595);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Adicione um orfanato",
            style: TextStyle(color: Colors.black, fontFamily: 'NunitoBlack')),
      ),
      body: Stack(
        children: [
          Map(
            latlongs: [latlng],
            onTapMap: (latlng) {
              print(this.latlng.longitude);
              this.setState(() {
                this.latlng = latlng;
              });
            },
          ),
          Positioned(
            bottom: 40,
            child: RaisedButton(
              onPressed: () {},
              child: Center(
                child: Text("Proximo"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
