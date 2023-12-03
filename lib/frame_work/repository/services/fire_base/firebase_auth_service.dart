
import 'package:emploiflutter/frame_work/repository/model/auth_response_model/auth_response_model.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_model.dart';
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

  Future<AuthResponseModel> verifyOtp(
      {required String verificationId, required String smsCode}) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      final result = await FireBaseSingleton.instance.firebaseAuth
          .signInWithCredential(phoneAuthCredential);
      final user = UserModel(userId: result.user!.uid, userPhone: result.user!.phoneNumber.toString());
      print(user.userPhone);
        return AuthResponseModel(user: user);
    } on FirebaseAuthException catch (e) {
      return AuthResponseModel(error: e.message);
    }
  }

  Future signOut() async {
    await FireBaseSingleton.instance.firebaseAuth.signOut();
  }
}
