// ignore_for_file: deprecated_member_use
import 'package:emploiflutter/frame_work/controller/authentication_controller/auth_intro_controller/auth_intro_controller.dart';
import 'package:emploiflutter/frame_work/controller/setting_controller/terms_privacy_policy_controller/terms_privacy_policy_controller.dart';
import 'package:emploiflutter/ui/authentication/login/login.dart';
import 'package:emploiflutter/ui/authentication/register/helper/choose_register_type/choose_register_type.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:flutter/scheduler.dart';
import 'package:page_transition/page_transition.dart';
import '../../frame_work/repository/services/hive_service/box_service.dart';
import '../utils/app_constant.dart';
import '../utils/theme/app_assets.dart';
import '../utils/theme/text_styles.dart';
import '../utils/theme/theme.dart';

class AuthIntro extends ConsumerStatefulWidget {
  const AuthIntro({super.key});

  @override
  ConsumerState<AuthIntro> createState() => _AuthIntroState();
}

class _AuthIntroState extends ConsumerState<AuthIntro> {

  @override
  void initState() {
    final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
    if(user != null){
      print(user.user.vFirstName);
    }else{
      print("no data");
    }
    // TODO: implement initState
    super.initState();
    ///------------- calling Location api and Store in Shared Preference ----------------///
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(authIntroController).getLocationList();
      ref.read(termsPrivacyPolicyController).termsApiRequest();
      ref.read(termsPrivacyPolicyController).privacyPolicyApiRequest();
      // print("AuthIntro Device Details  ${BoxService.boxService.nativeDeviceBox.get(deviceDetailKey)!.deviceVersion}");
    });
    ///----------------------------------------------------------------------------------///

  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: AppColors.colors.clayColors,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              ClipPath(
                clipper: CustomCurve(),
                child: Container(
                  height: size.height * 0.56,
                  width: size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(AppAssets.titleLog,scale: 6.5.sp,),
                      SizedBox(height: 8.h,),
                      Image.asset(AppAssets.welcome,scale: 7.sp,),
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    color: AppColors.colors.clayColors,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50.h,),
                    ElevatedButton(
                        onPressed: (){

                          Navigator.push(context, PageTransition(child: const Login(),type: PageTransitionType.scale,duration: const Duration(milliseconds: 600),alignment: Alignment.center));
                        },
                        style:  ElevatedButton.styleFrom(
                            onPrimary: Colors.white,
                            backgroundColor: AppColors.colors.blueColors,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r),side: const BorderSide(color: Colors.white,width: 1.5))
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: size.width* 0.25.w,vertical: 8.h),
                          child: Text("Login",style: TextStyles.w400.copyWith(fontSize: 20.sp,color: Colors.white),),
                        )),
                    SizedBox(height: 15.h,),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, PageTransition(child: const ChooseRegisterType(),type: PageTransitionType.scale,duration: const Duration(milliseconds: 600),alignment: Alignment.center));
                        },
                        style:  ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                            backgroundColor: AppColors.colors.clayColors,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r),side: const BorderSide(color: Colors.white,width: 1.5))
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: size.width* 0.21.w,vertical: 5.h),
                          child: Text("Register",style: TextStyles.w400.copyWith(fontSize: 20.sp,color: Colors.white),),
                        ))

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomCurve  extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w =  size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h); // 2. point
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w,0); // 5. point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}