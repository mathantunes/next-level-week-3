import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart";

class Map extends StatelessWidget {
  const Map({
    this.latlongs,
    this.onTapMarker,
    this.onTapMap,
    Key key,
  }) : super(key: key);

  final List<LatLng> latlongs;
  final VoidCallback onTapMarker;
  final ValueSetter<LatLng> onTapMap;
  @override
  Widget build(BuildContext context) {
    print('updating latlongs ${latlongs?.first?.latitude ?? 0}');
    return Container(
      child: FlutterMap(
        options: MapOptions(
            onTap: onTapMap ??
                () {
                  print("fake");
                },
            center: new LatLng(-23.4818636, -46.6144294),
            zoom: 15.0,
            screenSize: Size.infinite,
            maxZoom: 25,
            minZoom: 10),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://a.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          latlongs != null
              ? MarkerLayerOptions(
                  markers: latlongs
                      ?.map((e) => Marker(
                          height: 58,
                          width: 68,
                          point: e,
                          anchorPos: AnchorPos.align(AnchorAlign.top),
                          builder: (ctx) => GestureDetector(
                              onTap: onTapMarker ?? () {},
                              child: new Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('MapMarker.png'),
                                        fit: BoxFit.none,
                                        scale: 1.2)),
                              ))))
                      ?.toList())
              : MarkerLayerOptions()
        ],
      ),
    );
  }
}
