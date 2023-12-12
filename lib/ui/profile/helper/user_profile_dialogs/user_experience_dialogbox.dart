import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';

import 'helper/user_experience_dialogbox/user_experience_dialogbox_add_form.dart';
import 'helper/user_experience_dialogbox/user_experience_dialogbox_tile.dart';

class UserExperienceDialogBox extends ConsumerWidget {
  const UserExperienceDialogBox({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch = ref.watch(profileController);

    return SafeArea(
      child: Container(
        width: 340.w,
        height:profileWatch.isExperienceExpanded? 480.h : 200.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 10.h),
        margin: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom> 0? 230 : 0),
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(4.r)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Change Info",style: TextStyles.w600.copyWith(fontSize: 22.sp,color: AppColors.colors.blueColors),).paddingVertical(10.h),
            SizedBox(height: 10.h,),
             Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileWatch.isExperienceAddShow? const UserExperienceDialogBoxAddForm():
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 5.w),
                      decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(color: AppColors.colors.blueDark,width: 0.5)
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          Text("Add New Experience",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors),),
                          const Spacer(),
                          IconButton(onPressed: (){
                            profileWatch.updateIsExperienceAddShow(true);
                            profileWatch.updateIsExperienceExpanded(true);
                          }, icon: Icon(Icons.add,size: 18.sp,color: AppColors.colors.blueColors,)).paddingOnly(right: 6.w)
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    /// if user add the experience then show this Widget
                    profileWatch.userExperienceList.isNotEmpty? const UserExperienceDialogBoxTile():const SizedBox()
                  ],
                ),
              ),
            ),
          TextButton(onPressed: (){
            profileWatch.experienceOkButton();
            profileWatch.getUserExperienceApi();
            profileWatch.updateIsExperienceAddShow(false);
            profileWatch.updateIsExperienceExpanded(false);
          }, child: Text("Ok",style: TextStyles.w500.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors),))],
        ),
      ),
    );
  }
}
