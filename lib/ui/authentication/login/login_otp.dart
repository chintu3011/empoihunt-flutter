import 'package:emploiflutter/ui/dash_board/dash_board.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import '../../utils/theme/text_styles.dart';
import '../../utils/theme/theme.dart';

class LoginOTP extends StatelessWidget {
  const LoginOTP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppAssets.otpScreenIcon,height: 300.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Enter the Verification Code",style: TextStyles.w500.copyWith(fontSize: 25.sp,color: AppColors.colors.blueColors),),
                Text("6 - digit verification code sent to",style: TextStyles.w500.copyWith(fontSize: 12.sp,color: Colors.grey),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("+91886649266  ",style: TextStyles.w500.copyWith(fontSize: 14.sp,color: AppColors.colors.clayColors),),
                    Text("Change phone number?",style: TextStyles.w400.copyWith(fontSize: 16.sp,color: AppColors.colors.blueColors,decoration: TextDecoration.underline,decorationColor: AppColors.colors.blueColors),),
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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    keyboardType: TextInputType.phone,
                    length: 6,
                    onCompleted: (val){},
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
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const DashBoard()), (route) => false);
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
