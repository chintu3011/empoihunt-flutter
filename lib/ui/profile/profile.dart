import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/profile/helper/profile_profile_pic.dart';
import 'package:emploiflutter/ui/profile/helper/profile_user_details.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_show_dialog_layout.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../utils/theme/text_styles.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return CommonShowDialogLayout(
      show: profileWatch.isDialogShow,
      child: Scaffold(
        appBar: AppBar(
          title:   Text("Profile",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors,),),
        ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  const ProfileUserDetails(),
                  Positioned(
                    left: 120.w,
                      top: 70.h,
                      child: const ProfileProfilePic())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
