import 'package:emploihunt/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploihunt/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploihunt/ui/profile/profile_profile_pic.dart';
import 'package:emploihunt/ui/profile/profile_user_details.dart';
import 'package:emploihunt/ui/profile/helper/common_show_dialog_layout.dart';
import 'package:emploihunt/ui/utils/constant/app_constant.dart';
import 'package:emploihunt/ui/utils/theme/app_color.dart';
import 'package:emploihunt/ui/utils/theme/theme.dart';
import 'package:flutter/scheduler.dart';

import '../utils/common_widget/common_appbar.dart';
import '../utils/theme/text_styles.dart';

class Profile extends ConsumerStatefulWidget{
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  void initState() {
    final user= BoxService.boxService.userGetDetailBox.get(userDetailKey)!.user;
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
       user.iRole==0? ref.read(profileController).getUserExperienceApi():null;
    });
  }
  @override
  Widget build(BuildContext context,) {
    final profileWatch = ref.watch(profileController);
    final user= BoxService.boxService.userGetDetailBox.get(userDetailKey)!;
    return PopScope(
      canPop: true,
      onPopInvoked: (value){
        profileWatch.isDialogShow = false;
        profileWatch.userProfileDetailUpdateApi();
      },
      child: CommonShowDialogLayout(userDetailDataModel: user,
        show: profileWatch.isDialogShow,
        child: Scaffold(
          appBar:  const CommonAppBar(title: "Profile",isLeadingShow: true),
          body:  SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                     ProfileUserDetails(userModel: user.user,),
                    Positioned(
                      left: 120.w,
                        top: 70.h,
                        child: ProfileProfilePic(userModel: user.user,))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
