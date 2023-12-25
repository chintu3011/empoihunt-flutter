import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FirebaseStorageService{
  FirebaseStorageService._();

  static FirebaseStorageService storageService = FirebaseStorageService._();

  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  uploadImage({required String fileName, required File filePath,required String fromId,required String toId})async{
    try{
      final baseName = basename(filePath.path);
      final imageRef = firebaseStorage.ref('imagess/chatImages/$fromId/$toId/$baseName');
      await imageRef.putFile(filePath);
      await imageRef.getDownloadURL();
    }catch(e){
      Future.error("FireStorage Error -------->$e");
    }
  }


}

