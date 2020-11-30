import 'package:flutter/material.dart';
import 'package:happy/models/orphanage.dart';
import 'package:happy/services/orphanages.dart';
import 'package:latlong/latlong.dart';

class OrphanageForm extends StatefulWidget {
  OrphanageForm({Key key, this.latlng}) : super(key: key);
  final LatLng latlng;
  @override
  _OrphanageFormState createState() => _OrphanageFormState();
}

class _OrphanageFormState extends State<OrphanageForm> {
  final _formKey = GlobalKey<_OrphanageFormState>();
  final formPrimary = 0xFF8FA7B2;
  String nome, sobre;

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
        body: Container(
          color: Color(0xFFEBF2F5),
          child: Column(
            children: [
              Spacer(
                flex: 5,
              ),
              GroupTitle(
                formPrimary: formPrimary,
                text: "Dados",
              ),
              Divider(color: Color(0xFFD3E2E5)),
              Spacer(
                flex: 8,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    FieldHeader(
                      text: "Nome",
                    ),
                    fieldForm(1, 20, nome),
                    FieldHeader(
                      text: "Sobre",
                    ),
                    fieldForm(5, 300, sobre),
                    FieldHeader(
                      text: "Fotos",
                    ),
                    GroupTitle(
                      formPrimary: formPrimary,
                      text: "Visitação",
                    ),
                    Divider(color: Color(0xFFD3E2E5)),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () async {
                  await orphanageService.createOrphanage(Orphanage(
                      about: sobre,
                      name: nome,
                      latitude: widget.latlng.latitude,
                      longitude: widget.latlng.longitude));
                },
              )
            ],
          ),
        ));
  }

  String _validateText(String t) {
    if (t.length < 3) return 'Campo deve ter mais que 2 caracteres';
    return null;
  }

  Widget fieldForm(int maxLines, int maxLength, dynamic variable) {
    return TextFormField(
        validator: _validateText,
        autocorrect: true,
        enabled: true,
        maxLines: maxLines,
        maxLength: maxLength,
        onChanged: (value) {
          variable = value;
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD3E2E5)),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD3E2E5)),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD3E2E5)),
              borderRadius: BorderRadius.all(Radius.circular(15))),
        ));
  }
}

class GroupTitle extends StatelessWidget {
  const GroupTitle({Key key, @required this.formPrimary, this.text})
      : super(key: key);
  final String text;
  final int formPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Color(formPrimary),
          fontFamily: 'NunitoBlack',
          fontSize: 32,
        ),
      ),
    );
  }
}

class FieldHeader extends StatelessWidget {
  const FieldHeader({Key key, this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(text,
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.grey, fontFamily: 'Nunito')),
    );
  }
}
