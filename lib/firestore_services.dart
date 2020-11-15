import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static CollectionReference dokterCollection =
      FirebaseFirestore.instance.collection('DaftarDokter');

  static Future<void> createOrUpdateDokter(String namaDokter,
      {String dokterName, String dokterKategori}) async {
    await dokterCollection.doc(namaDokter).set({
      'dokterName': dokterName,
      'dokterKategori': dokterKategori,
    });
  }
}
