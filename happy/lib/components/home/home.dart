import 'package:flutter/material.dart';
import 'package:happy/components/createOrphanage/create.dart';
import 'package:happy/components/map/map.dart';
import 'package:happy/services/image.dart';
import 'package:happy/services/orphanages.dart';
import 'package:latlong/latlong.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return HomeMap();
  }
}

class HomeMap extends StatefulWidget {
  const HomeMap({Key key}) : super(key: key);

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  List<LatLng> orphanagesLatLng;

  Future<void> getOrphanages() async {
    var orphs = await orphanageService.getOrphanages();
    this.setState(() {
      this.orphanagesLatLng =
          orphs.map((e) => LatLng(e.latitude, e.longitude)).toList();
    });
  }

  @override
  void initState() {
    getOrphanages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: Stack(
        children: [
          Map(
            latlongs: this.orphanagesLatLng ?? null,
            onTapMap: (latlng) {},
          ),
          Positioned(
            bottom: 10,
            child: BottomNavBar(counter: this.orphanagesLatLng?.length ?? 0),
          ),
          Positioned(
            bottom: 15,
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
      ),
    );
    return scaffold;
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key key, this.counter}) : super(key: key);
  final int counter;
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
                "${counter ?? 0} Encontrados",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey, fontFamily: 'Nunito', fontSize: 20),
              ),
            )),
      ],
    );
  }
}
