import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageRepository {
  static Future<String> uploadImage(XFile prFile, String prFolder) async {
    Reference vrRef = FirebaseStorage.instance.ref("${prFolder}/${Timestamp.now().microsecondsSinceEpoch.toString()}");

    TaskSnapshot vrTask = await vrRef.putData(await prFile.readAsBytes());

    return vrTask.ref.getDownloadURL();
  }
}