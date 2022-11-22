import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {
  late final FirebaseStorage _storage;

  FirebaseStorageRepository() {
    _storage =
        FirebaseStorage.instanceFor(bucket: "gs://thimblestock1.appspot.com");
  }

  Future<String> uploadFile(String filePath) async {
    final file = File(filePath);

    final index = filePath.lastIndexOf("/") + 1;
    final filename = filePath.substring(index);
    

    try {
      
      await _storage.ref("clients/photo/archivo.jpg").putFile(file);
    } on FirebaseException catch (e) {
      
    }
    return "";
  }
}
