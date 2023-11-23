import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/profile/helper/profile_about_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_current_position_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_experience_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_qualification_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_resume_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_user_detail_tile.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../utils/theme/text_styles.dart';

class ProfileUserDetails extends ConsumerWidget {
  const ProfileUserDetails({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              profileWatch.setDialogValue(0);
              profileWatch.updateIsDialogShow();
            },
            child: SizedBox(
              height: 120.h,
              width: double.infinity,
              child: Image.asset(AppAssets.defaultBannerImage,fit: BoxFit.fitWidth,),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: const Column(
              children: [

                /// User Details///
                ProfileUserDetailTile(),

                /// User About Section ///
                ProfileAboutTile(),

                ///User Qualification ///
                ProfileQualificationTile(),

                ///User Experience OR User Current Position ///
                userRole == 0? ProfileExperienceTile() : ProfileCurrentPositionTile(),

                /// User Resume ////
               userRole == 0? ProfileResumeTile(): SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}