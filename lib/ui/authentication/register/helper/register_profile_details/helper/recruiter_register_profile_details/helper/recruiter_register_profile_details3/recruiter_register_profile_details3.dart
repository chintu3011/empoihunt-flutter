import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/recruiter_register_profile_details_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:lottie/lottie.dart';

class RecruiterRegisterProfileDetails3 extends ConsumerWidget {
  const RecruiterRegisterProfileDetails3({super.key});
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final registerProfileDetailsWatch =
        ref.watch(recruiterRegisterProfileDetailsController);
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
                   Stack(
                     children: [
                       registerProfileDetailsWatch.isPicAnimationRun?
                       Lottie.asset(
                         height: 250.h,
                         width: 260.w,
                         AppAssets.imgLoadingLottie,
                         controller: registerProfileDetailsWatch.uploadImgLottieController,
                       ):

                       Container(
                         height: 200.h,
                         width: 220.h,
                         clipBehavior: Clip.hardEdge,
                         decoration:  BoxDecoration(
                           color: Colors.white,
                           shape: BoxShape.circle,
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.5), // shadow color
                               spreadRadius: 3, // spread radius
                               blurRadius: 6, // blur radius
                               offset: Offset(0, 2), // changes position of shadow
                             ),
                           ],
                         ),
                         child: FittedBox(
                           fit: BoxFit.cover,
                           clipBehavior: Clip.hardEdge,
                           child: registerProfileDetailsWatch.profilePic !=null ? Card(child: Image.file(registerProfileDetailsWatch.profilePic!)): Image.asset(AppAssets.profilePicPng),
                         ),
                       ),
                       Positioned(
                         bottom: 0,
                         right: 30,
                         child: GestureDetector(
                           onTap: (){
                             registerProfileDetailsWatch.imagePicker();
                           },
                           child: Container(
                             height: 50.h,
                             width: 60.w,
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                               color: AppColors.colors.whiteColors,
                               shape: BoxShape.circle,
                             ),
                             child: Container(
                               height: 40.h,
                               width: 50.w,
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                 color: AppColors.colors.clayColors,
                                 shape: BoxShape.circle,
                               ),
                               child:  const Icon(Icons.add,color: Colors.white,),
                             ),
                           ),
                         ),
                       )
                     ],
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
