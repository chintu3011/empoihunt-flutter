import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:emploiflutter/ui/profile/helper/profile_about_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_current_position_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_experience_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_qualification_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_resume_tile.dart';
import 'package:emploiflutter/ui/profile/helper/profile_user_detail_tile.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../frame_work/controller/authentication_controller/register_controller/choose_user_role_controller/choose_user_role_controller.dart';

class ProfileUserDetails extends ConsumerWidget {
  final UserModel userModel;
  const ProfileUserDetails({super.key,required this.userModel});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    final userRoleWatch = ref.watch(chooseUserRoleController);

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
            child:  Column(
              children: [

                /// User Details///
                 ProfileUserDetailTile(user: userModel,),

                /// User About Section ///
                 ProfileAboutTile(user: userModel,),

                ///User Qualification ///
                 ProfileQualificationTile(user: userModel,),

                ///User Experience OR User Current Position ///
                userRoleWatch.userRole == 0? const ProfileExperienceTile() : const ProfileCurrentPositionTile(),

                /// User Resume ////
                userRoleWatch.userRole == 0?  ProfileResumeTile(user: userModel,): const SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}