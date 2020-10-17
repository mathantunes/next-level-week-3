import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:happy/models/orphanage.dart';

class _Orphanages {
  final dbRef = FirebaseFirestore.instance;

  Future<void> createOrphanage(Orphanage o) async {
    return await dbRef.collection("orphanages").add(o.toJSON());
  }
}

var orphanageService = new _Orphanages();
