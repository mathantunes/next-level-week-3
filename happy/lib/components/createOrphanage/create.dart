import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:happy/components/createOrphanage/form.dart';
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
            latlongs: latlng != null ? [latlng] : null,
            onTapMap: (latlng) {
              print(this.latlng.longitude);
              this.setState(() {
                this.latlng = latlng;
              });
            },
          ),
          latlng != null
              ? Positioned(
                  bottom: 40,
                  child: Container(
                    alignment: Alignment.center,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Color(0xFF2AB5D1))),
                      color: Color(0xFF2AB5D1),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OrphanageForm(latlng: this.latlng)));
                      },
                      child: Center(
                        child: Text("Proximo",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Nunito')),
                      ),
                    ),
                  ),
                )
              : Container(
                  color: Colors.transparent,
                )
        ],
      ),
    );
  }
}
