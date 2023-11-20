import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/profile/helper/user_experience_dialogbox/user_experience_dialogbox_update_form.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/theme/text_styles.dart';

class UserExperienceDialogBoxTile extends ConsumerWidget {
  const UserExperienceDialogBoxTile({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    return Column(
      children: List.generate(profileWatch.userExperienceList.length, (index) {

        final experience = profileWatch.userExperienceList[index];
        return Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 5.h,),
                Container(
                  padding:EdgeInsets.symmetric(vertical: 14.h),
                  color: AppColors.colors.whiteColors,
                  child: Card(
                    elevation: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 8.h),
                      decoration: BoxDecoration(
                        color: AppColors.colors.whiteColors,
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(color: AppColors.colors.blueDark,width: 0.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(experience.designation,style: TextStyles.w400.copyWith(fontSize: 18.sp,color: AppColors.colors.blueColors),),
                          Text(experience.companyName,style: TextStyles.w300.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(experience.location,style: TextStyles.w300.copyWith(fontSize: 14.sp,color: AppColors.colors.greyRegent),),
                              Text(experience.duration !=""? experience.duration! : "Present",style: TextStyles.w300.copyWith(fontSize: 14.sp,color: AppColors.colors.clayColors),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                profileWatch.selectedUserExperienceListIndex == index ? const UserExperienceDialogBoxUpdateFrom(): const SizedBox()
              ],
            ),
            Positioned(
              top: 0,
              right: 5.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    profileWatch.listEditButton(index: index, designation: experience.designation, companyName: experience.companyName,jobLocation: experience.location,duration: experience.duration);
                  }, icon: Icon(profileWatch.selectedUserExperienceListIndex == index ? Icons.cancel_outlined :Icons.edit,color: AppColors.colors.whiteColors,size: 18.sp),style:  ElevatedButton.styleFrom(backgroundColor: AppColors.colors.blueColors,padding: EdgeInsets.all(4.sp)),),
                  SizedBox(width: 5.w,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: AppColors.colors.whiteColors,size: 18.sp),style:  ElevatedButton.styleFrom(backgroundColor: AppColors.colors.blueColors,padding: EdgeInsets.all(6.sp)),),
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}