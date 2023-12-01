import 'package:emploiflutter/frame_work/repository/services/fire_base/firebase_auth_service.dart';
import 'package:emploiflutter/ui/dash_board/dash_board.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

final loginOtpController = ChangeNotifierProvider((ref) => LoginOtpController());

class LoginOtpController extends ChangeNotifier{

  final otpController = TextEditingController();

  String verId = '';
  bool codeSend = false;

  Future  verifyPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    // loading(context: context);
    try {
      await FirebaseAuthService.firebaseAuthService.signInWithPhone(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
            verifyOtp(smsCode: verId, context: context);
        },
        verificationFailed: (error) {
          print("verification Failed error --------------->> $error");
          // commonSnackBar(context: context, eText: error.message.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          codeSend = true;
          verId = verificationId;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (p0) {},
      );
    } on FirebaseAuthException catch (e) {
      print("Firbase Exception ---------->>> ${e.message}");
      // commonSnackBar(context: context, eText: e.message.toString());
    }
    notifyListeners();
  }

  Future verifyOtp(
      {required String smsCode, required BuildContext context}) async {
    // loading(context: context);
    final response = await FirebaseAuthService.firebaseAuthService
        .verifyOtp(verificationId: verId, smsCode: smsCode);
    if (response != null) {
        print(response);
        if(context.mounted){
        Navigator.push(context, PageTransition(
            child: const DashBoard(),
            type: PageTransitionType.rightToLeft,
            duration: const Duration(milliseconds: 300)));}
    } else {
      if (context.mounted) {
        Navigator.pop(context);
       print("something went wrong");
      }
    }
    notifyListeners();
  }
}