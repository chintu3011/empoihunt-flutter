import 'package:emploiflutter/ui/authentication/login/login.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:page_transition/page_transition.dart';
import '../utils/theme/app_assets.dart';
import '../utils/theme/text_styles.dart';
import '../utils/theme/theme.dart';

class AuthIntro extends StatelessWidget {
  const AuthIntro({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: AppColors.colors.clayColors,
      body: SafeArea(
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
                    Image.asset(AppAssets.titleLog,scale: 6.5,),
                    SizedBox(height: 8.h,),
                    Image.asset(AppAssets.welcome,scale: 7,),
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
                      },
                      style:  ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          backgroundColor: AppColors.colors.blueColors,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r),side: const BorderSide(color: Colors.white,width: 1.5))
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: size.width* 0.25.w,vertical: 8.h),
                        child: Text("Login",style: TextStyles.w400.copyWith(fontSize: 22.sp,color: Colors.white),),
                      )),
                  SizedBox(height: 15.h,),
                  ElevatedButton(
                      onPressed: (){},
                      style:  ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                          backgroundColor: AppColors.colors.clayColors,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r),side: const BorderSide(color: Colors.white,width: 1.5))
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: size.width* 0.21.w,vertical: 5.h),
                        child: Text("Register",style: TextStyles.w400.copyWith(fontSize: 22.sp,color: Colors.white),),
                      ))

                ],
              ),
            ),
          ],
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

    //(0,0)   // 1. point
    path.lineTo(0, h); // 2. point
    path.quadraticBezierTo(w * 0.5, h - 100, w, h);
    path.lineTo(w,0); // 5. point
    path.close();


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

}