import 'package:emploiflutter/frame_work/controller/authentication_controller/login_controller/login_otp_controller.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import '../../utils/theme/text_styles.dart';
import '../../utils/theme/theme.dart';

class LoginOTP extends ConsumerStatefulWidget {
  final String number;
  const LoginOTP(this.number, {super.key});

  @override
  ConsumerState<LoginOTP> createState() => _LoginOTPState();
}

class _LoginOTPState extends ConsumerState<LoginOTP> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async{
     await ref.read(loginOtpController).verifyPhoneNumber(phoneNumber: widget.number, context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginOtp = ref.watch(loginOtpController);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h,),
            Image.asset(AppAssets.otpScreenIcon,height: 300.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Enter the Verification Code",style: TextStyles.w500.copyWith(fontSize: 23.sp,color: AppColors.colors.blueColors),),
                Text("6 - digit verification code sent to",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: Colors.grey),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("+91886649266 ",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: AppColors.colors.clayColors),),
                    Text("Change phone number?",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors,decoration: TextDecoration.underline,decorationColor: AppColors.colors.blueColors),),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 28.h),
                  margin: EdgeInsets.symmetric(horizontal: 18.w,vertical: 15.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: AppColors.colors.clayColors,width: 1.5.w)
                  ),
                  child: Pinput(
                    controller: loginOtp.otpController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.phone,
                    length: 6,
                    onCompleted: (val){
                      loginOtp.verifyOtp(smsCode: loginOtp.verId, context: context);
                    },
                    errorPinTheme: PinTheme(
                        height: 50.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: Colors.red,width: 2.w)
                        )),
                    defaultPinTheme: PinTheme(
                        height: 50.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: AppColors.colors.clayColors,width: 2.w)
                        )),
                    focusedPinTheme: PinTheme(
                      height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColors.colors.clayColors)
                    )),
                    disabledPinTheme: PinTheme(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColors.colors.clayColors)
                    )),
                  ),
                ),
                SizedBox(height: 15.h,),
                CommonButton(btnText: "Verify", onPressed: (){
                  loginOtp.verifyOtp(smsCode: loginOtp.verId, context: context,);

                  // Navigator.pushAndRemoveUntil(context, PageTransition(child: const DashBoard(), type: PageTransitionType.topToBottom,duration: const Duration(milliseconds: 800),childCurrent: this), (route) => false);
                },txtPadding: EdgeInsets.symmetric(horizontal: 85.w,vertical: 8.h),fontSize: 18.sp,),
                SizedBox(height: 10.h,),
                Text("Resend OTP in 30 second",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
