import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService{
  FirebaseStorageService._();

  static FirebaseStorageService storageService = FirebaseStorageService._();

  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

}

