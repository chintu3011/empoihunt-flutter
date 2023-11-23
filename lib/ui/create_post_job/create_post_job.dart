import 'package:emploiflutter/ui/create_post_job/helper/create_post_job_bottom_button.dart';
import 'package:emploiflutter/ui/create_post_job/helper/create_post_job_dropdown_forms.dart';
import 'package:emploiflutter/ui/create_post_job/helper/create_post_job_skills_widget.dart';
import 'package:emploiflutter/ui/create_post_job/helper/create_post_job_working_mode.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../utils/theme/text_styles.dart';

class CreatePostJob extends StatelessWidget {
  const CreatePostJob({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CommonAppBar(title: "Create Job Post",),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 15.h),
        child: Column(
          children: [
            CommonFormField(hintText: "Job Title",labelText: "job Title",prefixIcon: Icon(Icons.cases_outlined,color: AppColors.colors.blueColors,),),
            SizedBox(height: 10.h,),
            CommonFormField(hintText: "Company name",labelText: "Company name",prefixIcon: Icon(Icons.maps_home_work_outlined,color: AppColors.colors.blueColors,),),

            /// Company Logo ///
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.colors.greyRegent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16.r)
              ),
              child: Row(
                children: [
                  Icon(Icons.cloud_upload,color: AppColors.colors.blueColors,size: 25.sp,).paddingOnly(right: 6.w),
                  Text("Select your Organization logo",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blackColors),)
                ],
              ),
            ).paddingVertical(10.h),

            CommonFormField(hintText: "Job Description Here", prefixIcon: Icon(Icons.file_copy,color: AppColors.colors.blueColors,), maxLine: 4, contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10.w),).paddingVertical(10.h),
            CommonFormField(hintText: "Job Role & Responsibility", prefixIcon: Icon(Icons.storage_rounded,color: AppColors.colors.blueColors,), maxLine: 4, contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 10.w),),
            CommonFormField(hintText: "Required Experience",labelText: "Required Experience",prefixIcon: Icon(Icons.star,color: AppColors.colors.blueColors,),).paddingOnly(top: 10.h),

            /// Job Skills Forms ///
            const CreatePostJobSkillsWidget(),

            /// Job DropDown Forms ///
            const CreatePostJobDropDownForms(),

            SizedBox(height: 10.h,),
            CommonFormField(hintText: "Salary Package",labelText: "Salary Package",prefixIcon: Icon(Icons.currency_rupee,color: AppColors.colors.blueColors,),),

            /// Working Mode
            const CreatePostJobWorkingMode(),

            CommonFormField(hintText: "Need of Employees",labelText: "Number of Employees",prefixIcon: Icon(Icons.people,color: AppColors.colors.blueColors,),),

            SizedBox(height: 10.h,),
            /// Bottom Button ///
            const CreatePostJobBottomButton()
          ],
        ),
      ),
    );
  }
}
