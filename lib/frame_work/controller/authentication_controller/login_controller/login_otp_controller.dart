import 'dart:async';
import 'package:emploiflutter/frame_work/repository/services/fire_base/firebase_auth_service.dart';
import 'package:emploiflutter/ui/dash_board/dash_board.dart';
import 'package:emploiflutter/ui/utils/common_widget/helper.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

final loginOtpController = ChangeNotifierProvider((ref) => LoginOtpController());

class LoginOtpController extends ChangeNotifier{

  final otpController = TextEditingController();

  String verId = '';
  bool codeSend = false;
  bool isLoading = false;



  /// ------------- login with firebase otp--------------///
   Future  verifyPhoneNumber(
      {required String phoneNumber, required BuildContext context}) async {
    try {
      isLoading = true;
      await FirebaseAuthService.firebaseAuthService.signInWithPhone(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
            verifyOtp(context: context);
        },
        verificationFailed: (error) {
          debugPrint("verification Failed error --------------->> $error");
        },
        codeSent: (verificationId, forceResendingToken) {
          isLoading= false;
          codeSend = true;
          verId = verificationId;
          debugPrint("verification Id $verId");
          timerFunction();
          appCommonShowToast(context: context, msg: "Code have been Sent \n to this number $phoneNumber");
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (p0) {},
      );
    } on FirebaseAuthException catch (e) {
      isLoading =false;
      debugPrint("Firbase Exception ---------->>> ${e.message}");
    }
    notifyListeners();
  }



  Future verifyOtp(
      {required BuildContext context}) async {
    isLoading = true;
    final response = await FirebaseAuthService.firebaseAuthService
        .verifyOtp(verificationId: verId, smsCode: otpController.text);
    if (response.user != null) {
      notifyListeners();
      isLoading = false;
      debugPrint("Logged in user phone-------> ${response.user!.userPhone}");
        if(context.mounted){
        Navigator.pushAndRemoveUntil(context, PageTransition(
            child: const DashBoard(),
            type: PageTransitionType.rightToLeft,
            duration: const Duration(milliseconds: 300)), (route) => false);
        }
    } else {
      if (context.mounted) {
        isLoading= false;
        Navigator.pop(context);
        debugPrint("something went wrong");
      }
    }
    notifyListeners();
  }
/// ------------- login with firebase otp--------------///



  ///----------------------------- Timer function -----------------------------///

  static const maxSecond = 30;
  Timer? time;
  int second = maxSecond;

  void timerFunction() {
    time = Timer.periodic(const Duration(seconds: 1), (_) {
      if (second > 0) {
        second--;
        notifyListeners();
      } else {
        stopAndResetTimer();
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void stopAndResetTimer() {
    second = maxSecond;
    time?.cancel();
    notifyListeners();
  }
///----------------------------- Timer function -----------------------------///

}