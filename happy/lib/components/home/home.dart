import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart";

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return HomeMap();
  }
}

class HomeMap extends StatelessWidget {
  const HomeMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        options: MapOptions(
            center: new LatLng(-23.4818636, -46.6144294),
            zoom: 15.0,
            screenSize: Size.infinite,
            maxZoom: 25,
            minZoom: 10),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'])
        ],
      ),
    );
  }
}
