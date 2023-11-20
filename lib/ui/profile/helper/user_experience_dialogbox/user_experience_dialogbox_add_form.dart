import 'dart:ui';

import 'package:emploiflutter/frame_work/controller/profile_controller/profile_controller.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../../utils/theme/text_styles.dart';

class UserExperienceDialogBoxAddForm extends ConsumerWidget {
  const UserExperienceDialogBoxAddForm({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final profileWatch = ref.watch(profileController);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 3.h),
      decoration: BoxDecoration(
        color: AppColors.colors.whiteColors,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonFormField(
            controller: profileWatch.userExperienceDesignFieldController,
            hintText: "Designation",labelText: "Designation",prefixIcon: Icon(Icons.person,color: AppColors.colors.blueColors,),),
          SizedBox(height: 10.h,),
          CommonFormField(
            controller: profileWatch.userExperienceCompanyNameFieldController,
            hintText: "Company name",labelText: "Company name",prefixIcon: Icon(Icons.person,color: AppColors.colors.blueColors,),),
          SizedBox(height: 20.h,),
          CommonFormField(
            controller: profileWatch.userExperienceJobLocationFieldController,
          hintText: "Company name",labelText: "Job Location",prefixIcon: Icon(Icons.person,color: AppColors.colors.blueColors,),),
          Row(
            children: [
              Checkbox(value: true, onChanged: (val){}),
              SizedBox(width: 5.w,),
              Expanded(child: Text("Are you working here ?",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: Colors.black),))
            ],
          ).paddingOnly(top: 15.h,bottom: 10.h),
          CommonFormField(
            controller: profileWatch.userExperienceDurationFieldController,
            hintText: "Duration",labelText: "Duration",prefixIcon: Icon(Icons.person,color: AppColors.colors.blueColors,),),
          Text("Enter Duration in years",style: TextStyles.w300.copyWith(fontSize: 10.sp,color: AppColors.colors.greyRegent),),
          Row(
            children: [
              const Spacer(),
              CommonButton(btnText: "Add", onPressed: (){
                profileWatch.userExperienceAddButton();
              },textColor: AppColors.colors.blueColors,backgroundColor: AppColors.colors.clayColors,txtPadding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 8.w),fontSize: 14.sp,)
            ],
          )
        ],
      ),
    );
  }
}
