import 'package:emploiflutter/ui/authentication/register/register.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:page_transition/page_transition.dart';


class ChooseRegisterType extends StatelessWidget {
  const ChooseRegisterType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAssets.appLogo,scale: 16,),
                Text("Choose your role",style: TextStyles.w400.copyWith(fontSize: 28.sp,color: AppColors.colors.blueColors),),
                Padding(
                  padding:  EdgeInsets.only(top: 80.h,bottom: 20.h),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                    surfaceTintColor: Colors.white,
                    elevation: 6,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6.r),
                      splashColor: Colors.blue.shade100,
                      onTap: (){
                        Navigator.push(context, PageTransition(child: const Register(), type: PageTransitionType.leftToRight,duration: const Duration(milliseconds: 300)));
                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>const Register()));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 150.h,
                            width: 170.w,
                            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black,width: 2.w),
                                image: const DecorationImage(
                                    image: AssetImage(AppAssets.registerNeedJob),
                                    scale: 18,
                                    fit: BoxFit.contain
                                )
                            ),
                          ),
                          Text("I need Job",style: TextStyles.w600.copyWith(fontSize: 18.sp,color: Colors.black),),
                          SizedBox(height: 5.h,)
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Divider(height: 1.5.h,color: Colors.black,)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.sp),
                      child: Text("OR",style: TextStyles.w300.copyWith(fontSize: 12.sp,color: Colors.black),),
                    ),
                    Expanded(child: Divider(height: 1.5.h,color: Colors.black,))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h,),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.r)),
                    surfaceTintColor: Colors.white,
                    elevation: 6,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(6.r),
                      splashColor: Colors.blue.shade100,
                      onTap: (){
                        Navigator.push(context, PageTransition(child: const Register(), type: PageTransitionType.leftToRight,duration: const Duration(milliseconds: 300)));
                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>const Register()));
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 150.h,
                            width: 170.w,
                            margin: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.h),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black,width: 2.w),
                                image: const DecorationImage(
                                    image: AssetImage(AppAssets.registerHiringGirl),
                                    scale: 18,
                                    fit: BoxFit.contain
                                )
                            ),
                          ),
                          Text("I am Hiring",style: TextStyles.w600.copyWith(fontSize: 18.sp,color: Colors.black),),
                          SizedBox(height: 5.h,)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
