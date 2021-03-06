import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:happy/models/orphanage.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:image_picker_web/image_picker_web.dart';

class _Orphanages {
  final dbRef = FirebaseFirestore.instance;
  final orphCollection = "orphanages";
  Future<void> createOrphanage(Orphanage o) async =>
      await dbRef.collection(orphCollection).add(o.toJSON());

  Future<List<Orphanage>> getOrphanages() async {
    var query = await dbRef.collection(orphCollection).get();
    return query.docs.map((e) => Orphanage.fromJSON(e.data(), e.id)).toList();
  }

  Future<Orphanage> getOrphanage(String id) async {
    var orp = await dbRef.collection(orphCollection).doc(id).get();
    return Orphanage.fromJSON(orp.data(), orp.id);
  }

  Future<void> uploadImage(Orphanage o, MediaInfo blob) async {
    var metadata = fb.UploadMetadata(
      contentType: "png",
    );

    var ref = fb
        .storage()
        .refFromURL("gs://go-serverless-gcloud.appspot.com")
        .child("orphanages/${o.id}_${blob.fileName}.png");
    var upTask = ref.put(blob.data, metadata);
    var taskSnap = await upTask.future;
    var url = await taskSnap.ref.getDownloadURL();
    o.images.add(url.path);
    await dbRef.collection(orphCollection).doc(o.id).update(o.toJSON());
  }
}

var orphanageService = new _Orphanages();
