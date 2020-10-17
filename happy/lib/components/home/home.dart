import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:happy/models/orphanage.dart';
import 'package:happy/services/orphanages.dart';
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
    return Stack(
      children: [
        Container(
          child: FlutterMap(
            options: MapOptions(
                center: new LatLng(-23.4818636, -46.6144294),
                zoom: 15.0,
                screenSize: Size.infinite,
                maxZoom: 25,
                minZoom: 10),
            layers: [
              TileLayerOptions(
                  urlTemplate:
                      "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'])
            ],
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            var o = Orphanage();
            o.name = "Teste123";
            orphanageService.createOrphanage(o);
          },
        )
      ],
    );
  }
}
