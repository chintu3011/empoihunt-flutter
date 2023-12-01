import 'package:firebase_auth/firebase_auth.dart';

class FireBaseSingleton{
  FireBaseSingleton._();

  static FireBaseSingleton instance = FireBaseSingleton._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

}