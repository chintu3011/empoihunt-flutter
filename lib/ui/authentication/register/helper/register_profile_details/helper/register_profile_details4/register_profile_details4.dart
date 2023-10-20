import 'package:emploiflutter/frame_work/controller/authentication/register_controller/register_profile_details_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:lottie/lottie.dart';

class RegisterProfileDetails4 extends ConsumerWidget {
  const RegisterProfileDetails4({super.key});
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final registerProfileDetailsWatch =
        ref.watch(registerProfileDetailsController);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          Text(
            "Profile Image",
            style: TextStyles.w400
                .copyWith(fontSize: 18.sp, color: AppColors.colors.blueColors),
          ),
          Divider(
            color: AppColors.colors.blueColors,
            thickness: 4.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              child:  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   GestureDetector(
                     onTap: (){
                       registerProfileDetailsWatch.imagePicker();
                     },
                     child: registerProfileDetailsWatch.profilePic !=null?
                     Stack(
                       children: [
                         Container(
                           height: 260.h,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(color: AppColors.colors.blueColors,width: 4.w),
                             image: DecorationImage(
                               image: FileImage(registerProfileDetailsWatch.profilePic!),
                               fit: BoxFit.contain,
                             )
                           ),
                         ),
                       ],
                     ):
                     Lottie.asset(
                       height: 260.h,
                       AppAssets.imgLoadingLottie,
                       controller: registerProfileDetailsWatch.uploadImgLottieController,
                     ),
                   ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
