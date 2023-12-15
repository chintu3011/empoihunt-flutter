import 'package:emploiflutter/frame_work/controller/manage_job_post_controller/manage_job_post_controller.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme/app_assets.dart';

class UpdatePostSkillsWidget extends ConsumerWidget {
  const UpdatePostSkillsWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final managePostJobWatch = ref.watch(manageJobPostController);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Technical Skills ///
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          width: double.infinity,
          height: 150.h,
          color: AppColors.colors.whiteCatskill,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: CommonFormField(
                      controller: managePostJobWatch.requiredTechnicalSkillsController,
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      hintText: "Developer",labelText: "Required Technical Skills",prefixIcon: SvgPicture.asset(AppAssets.skillsSvg,color: AppColors.colors.blueColors,).paddingSymmetric(vertical: 10.h,horizontal: 10.w),)),
                    SizedBox(width: 10.w,),
                    IconButton(
                      onPressed: (){
                        managePostJobWatch.addTechnicalSkill();
                      }, icon: Icon(Icons.add,size: 20.sp,),style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: AppColors.colors.greyRegent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        elevation: 1.5,
                        padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 8.h)
                    ),)
                  ],
                ),
                managePostJobWatch.technicalSkillsList.isEmpty?const SizedBox(): Wrap(
                  children: List.generate(managePostJobWatch.technicalSkillsList.length, (index) {
                    final skill = managePostJobWatch.technicalSkillsList[index];
                    return Container(
                      margin: EdgeInsets.all(10.sp),
                      padding: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                          color: AppColors.colors.whiteColors,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: AppColors.colors.blueColors,width: 0.5.w)
                      ),
                      child: Text(skill,style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        managePostJobWatch.isTechnicalSkillEmpty?Text("Please add at least one skills",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: Colors.red.shade400,),):const SizedBox(),

        /// Soft Skills ///
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h),
          width: double.infinity,
          height: 150.h,
          color: AppColors.colors.whiteCatskill,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 6.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: CommonFormField(
                      controller: managePostJobWatch.requiredSoftSkillsController,
                      contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                      hintText: "Communication",labelText: "Required Soft Skills",prefixIcon: SvgPicture.asset(AppAssets.skillsSvg,color: AppColors.colors.blueColors,).paddingSymmetric(vertical: 10.h,horizontal: 10.w),)),
                    SizedBox(width: 10.w,),
                    IconButton(
                      onPressed: (){
                        managePostJobWatch.addSoftSkill();
                      }, icon: Icon(Icons.add,size: 20.sp,),style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shadowColor: AppColors.colors.greyRegent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        elevation: 1.5,
                        padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 8.h)
                    ),)
                  ],
                ),
                managePostJobWatch.softSkillsList.isEmpty?const SizedBox(): Wrap(
                  children: List.generate(managePostJobWatch.softSkillsList.length, (index) {
                    final skill = managePostJobWatch.softSkillsList[index];
                    return Container(
                      margin: EdgeInsets.all(10.sp),
                      padding: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                          color: AppColors.colors.whiteColors,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: AppColors.colors.blueColors,width: 0.5.w)
                      ),
                      child: Text(skill,style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blueColors),),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        managePostJobWatch.isSoftSkillEmpty?Text("Please add at least one skills",style: TextStyles.w400.copyWith(fontSize: 10.sp,color: Colors.red.shade400,),):const SizedBox(),
      ],
    );
  }
}
