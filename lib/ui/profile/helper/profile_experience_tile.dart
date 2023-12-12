import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class ProfileExperienceTile extends ConsumerWidget {
  const ProfileExperienceTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileWatch = ref.watch(profileController);
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 6,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(6.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Experience",
                  style: TextStyles.w500.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.colors.blackColors),
                ),
                IconButton(onPressed: (){
                  profileWatch.setDialogValue(5);
                  profileWatch.updateIsDialogShow();
                },icon: Icon(Icons.edit,size: 18,color: AppColors.colors.blueColors,),)                          ],
            ),
            SizedBox(height: 10.h,),
            profileWatch.isExperienceLoading? const Center(child: CircularProgressIndicator(),):
            profileWatch.userExperienceList.isEmpty?  const SizedBox():
                Column(
                  children: List.generate(profileWatch.userExperienceList.length, (index) {
                    final experience = profileWatch.userExperienceList[index];
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                      width: size.width * 0.90 ,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: AppColors.colors.blueDark,width: 1.5.w),
                          color: AppColors.colors.whiteColors
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(experience.vDesignation??"",overflow:TextOverflow.ellipsis,style: TextStyles.w500.copyWith(fontSize: 20.sp,color: AppColors.colors.blueDark),),
                          Text(experience.vCompanyName??"",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(experience.vJobLocation??"",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),),
                              Text(experience.bIsCurrentCompany == 1? "Present":"",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.clayColors),)
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                )
          ],
        ),
      ),
    );
  }
}
