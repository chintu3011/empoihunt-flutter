
import 'package:emploiflutter/frame_work/repository/services/fire_base/firebase_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuthService._();

  static FirebaseAuthService firebaseAuthService = FirebaseAuthService._();

  ///------------Mobile Authentication ----------///
  Future<void> signInWithPhone(
      {required String phoneNumber,
      required void Function(PhoneAuthCredential) verificationCompleted,
      required void Function(FirebaseAuthException) verificationFailed,
      required void Function(String, int?) codeSent,
      required void Function(String) codeAutoRetrievalTimeout}) async {
    try {
      await FireBaseSingleton.instance.firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 30),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } on FirebaseAuthException catch (e) {
      // commonSnackBar(context: context, eText: e.message.toString());
      Future.error(e.message.toString());
    }
  }

  Future verifyOtp(
      {required String verificationId, required String smsCode}) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      final result = await FireBaseSingleton.instance.firebaseAuth
          .signInWithCredential(phoneAuthCredential);
      return result.user!.phoneNumber;
      // final myUser = MyUser(
      //     userId: result.user!.uid, phoneNumber: result.user!.phoneNumber!);
      // return UserResponse(user: myUser);
    } on FirebaseAuthException catch (e) {
      Future.error(e.message.toString());
      // return UserResponse(error: e.message.toString());
    }
  }

  Future signOut() async {
    await FireBaseSingleton.instance.firebaseAuth.signOut();
  }
}
