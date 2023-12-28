import 'dart:async';

import 'package:emploiflutter/frame_work/repository/services/fire_base/firebase_auth_service.dart';
import 'package:emploiflutter/ui/authentication/register/helper/register_profile_details/helper/job_seeker_register_profile_details/job_seeker_register_profile_details.dart';
import 'package:emploiflutter/ui/authentication/register/helper/register_profile_details/helper/recruiter_register_profile_details/recruiter_register_profile_details.dart';
import 'package:emploiflutter/ui/utils/common_widget/helper.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';

final registerOtpController = ChangeNotifierProvider((ref) => RegisterOtpController());

class RegisterOtpController extends ChangeNotifier{

  final otpController = TextEditingController();

  String verId = '';
  bool codeSend = false;
  bool isLoading = false;



  /// ------------- login with firebase otp--------------///
   Future  verifyPhoneNumber(
      {required String phoneNumber, required BuildContext context,required int selectedUserType,Widget? childCurrent}) async {
    try {
      isLoading = true;
      await FirebaseAuthService.firebaseAuthService.signInWithPhone(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
            verifyOtp(context: context,selectedUserType: selectedUserType,childCurrent: childCurrent);
        },
        verificationFailed: (error) {
          isLoading= false;
          notifyListeners();
          debugPrint("verification Failed error --------------->> $error");
        },
        codeSent: (verificationId, forceResendingToken) {
          isLoading= false;
          codeSend = true;
          verId = verificationId;
          second = maxSecond;
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

  int? forceResendingToken;
  Future  resendVerifyPhoneNumber(
      {required String phoneNumber, required BuildContext context,required int selectedUserType,Widget? childCurrent}) async {
    try {
      forceResendingToken = null;
      isLoading = true;
      await FirebaseAuthService.firebaseAuthService.resendOtp(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          verifyOtp(context: context,selectedUserType: selectedUserType,childCurrent: childCurrent);
        },
        verificationFailed: (error) {
          isLoading= false;
          notifyListeners();
          debugPrint("verification Failed error --------------->> $error");
        },
        codeSent: (verificationId, forceResendingToken) {
          isLoading= false;
          codeSend = true;
          verId = verificationId;
          second = maxSecond;
          this.forceResendingToken = forceResendingToken;
          debugPrint("verification Id $verId");
          timerFunction();
          appCommonShowToast(context: context, msg: "Code have been Sent \n to this number $phoneNumber");
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (p0) {}, forceResendingToken: forceResendingToken,
      );
    } on FirebaseAuthException catch (e) {
      isLoading =false;
      debugPrint("Firbase Exception ---------->>> ${e.message}");
    }
    notifyListeners();
  }


  String uid ="";
  Future verifyOtp(
      {required BuildContext context,required int selectedUserType,Widget? childCurrent}) async {
    isLoading = true;
    final response = await FirebaseAuthService.firebaseAuthService
        .verifyOtp(verificationId: verId, smsCode: otpController.text);
    if (response.user != null) {
      notifyListeners();
      isLoading = false;
      uid = response.user!.userId;
      debugPrint("Verified user phone -------> ${response.user!.userPhone}");
        if(context.mounted){
      if(selectedUserType == 0){
        Navigator.pop(context);
        Navigator.push(context, PageTransition(child: const JobSeekerRegisterProfileDetails(), type: PageTransitionType.rightToLeft,childCurrent: childCurrent,duration: const Duration(milliseconds: 300)));
        otpController.clear();
      }else{
        Navigator.pop(context);
        Navigator.push(context, PageTransition(child: const RecruiterRegisterProfileDetails(), type: PageTransitionType.rightToLeft,childCurrent: childCurrent,duration: const Duration(milliseconds: 300)));
        otpController.clear();
      }
        }
    } else {
      if (context.mounted) {
        isLoading= false;
        showSnackBar(context: context, error: "OTP does not match");
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
    time?.cancel();
    notifyListeners();
  }
///----------------------------- Timer function -----------------------------///

}