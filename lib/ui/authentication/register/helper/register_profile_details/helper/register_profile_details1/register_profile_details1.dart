import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/register_profile_details_controller.dart';
import 'package:emploiflutter/ui/utils/app_string_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_dropdown_form_field.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class RegisterProfileDetails1 extends ConsumerWidget {
  const RegisterProfileDetails1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerProfileDetailsWatch =
        ref.watch(registerProfileDetailsController);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          Text(
            "Tell about your self",
            style: TextStyles.w400
                .copyWith(fontSize: 18.sp, color: AppColors.colors.blueColors),
          ),
          Divider(
            color: AppColors.colors.blueColors,
            thickness: 4.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CommonFormField(
                      maxLength: 2000,
                      hintText: "Bio",
                      prefixIcon: const Icon(Icons.file_copy_rounded),
                      maxLine: 4,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 10.w),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CommonDropDownFormField(items: qualificationsList, searchController: registerProfileDetailsWatch.qualificationSearchController,selectedValue: registerProfileDetailsWatch.selectedQualification,onChanged: (value){
                      registerProfileDetailsWatch.updateSelectedQualification(value);
                    }, hintTextForDropdown: 'Qualification', hintTextForField: 'Qualification',),

                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Are ou experienced or fresher?",
                style: TextStyles.w400.copyWith(
                    fontSize: 12.sp, color: AppColors.colors.blueColors),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.grey),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          registerProfileDetailsWatch.updateFresher();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: registerProfileDetailsWatch.isFresher
                                  ? AppColors.colors.blueColors
                                  : Colors.grey),
                          child: Text(
                            "Fresher",
                            style: TextStyles.w500.copyWith(
                                fontSize: 14.sp,
                                color: registerProfileDetailsWatch.isFresher
                                    ? AppColors.colors.whiteColors
                                    : AppColors.colors.blackColors),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          registerProfileDetailsWatch.updateExperienced();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: registerProfileDetailsWatch.isExperienced
                                  ? AppColors.colors.blueColors
                                  : Colors.grey),
                          child: Text(
                            "Experienced",
                            style: TextStyles.w500.copyWith(
                                fontSize: 14.sp,
                                color: registerProfileDetailsWatch.isExperienced
                                    ? AppColors.colors.whiteColors
                                    : AppColors.colors.blackColors),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}