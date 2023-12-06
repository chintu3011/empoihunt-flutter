import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/job_seeker_register_profile_details_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_dropdown_form_field.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/app_string_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class JobSeekerRegisterProfileDetails3 extends ConsumerWidget {
  const JobSeekerRegisterProfileDetails3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerProfileDetailsWatch =
        ref.watch(jobSeekerRegisterProfileDetailsController);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          Text(
            "Your job Preference",
            style: TextStyles.w400
                .copyWith(fontSize: 18.sp, color: AppColors.colors.blueColors),
          ),
          Divider(
            color: AppColors.colors.blueColors,
            thickness: 4.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonDropDownFormField(
                      items: designationList,
                      searchController:
                          registerProfileDetailsWatch.jobSearchController,
                      onChanged: (value) {
                        registerProfileDetailsWatch
                            .updateSelectedJobTitle(value);
                      },
                      hintTextForDropdown: "Job Title",
                      hintTextForField: "Job Title",
                      selectedValue:
                          registerProfileDetailsWatch.selectedJobTitle,
                    ),
                    registerProfileDetailsWatch.isSelectedJobTitleEmt?Text("Please select Job title",style: TextStyles.w300.copyWith(fontSize: 12.sp,color: Colors.red),):const SizedBox(),

                    SizedBox(
                      height: 25.h,
                    ),
                    CommonDropDownFormField(
                      items: SharedPrefServices.services.getList(locationListKey)??["No data"],
                      searchController:
                      registerProfileDetailsWatch.preferCitySearchController,
                      onChanged: (value) {
                        registerProfileDetailsWatch
                            .updateSelectedPreferCity(value);
                      },
                      hintTextForDropdown: "Prefer City",
                      hintTextForField: "Prefer City",
                      selectedValue:
                      registerProfileDetailsWatch.selectedPreferCity,
                    ),
                    registerProfileDetailsWatch.isSelectedPrefCityEmt?Text("Please select Prefer City",style: TextStyles.w300.copyWith(fontSize: 12.sp,color: Colors.red),):const SizedBox(),

                  ],
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select your prefer working mode",
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
                          registerProfileDetailsWatch.updateOnSite();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: registerProfileDetailsWatch.isOnSite
                                  ? AppColors.colors.blueColors
                                  : Colors.grey),
                          child: Text(
                            "On-Site",
                            style: TextStyles.w500.copyWith(
                                fontSize: 14.sp,
                                color: registerProfileDetailsWatch.isOnSite
                                    ? AppColors.colors.whiteColors
                                    : AppColors.colors.blackColors),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          registerProfileDetailsWatch.updateRemote();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: registerProfileDetailsWatch.isRemote
                                  ? AppColors.colors.blueColors
                                  : Colors.grey),
                          child: Text(
                            "Remote",
                            style: TextStyles.w500.copyWith(
                                fontSize: 14.sp,
                                color: registerProfileDetailsWatch.isRemote
                                    ? AppColors.colors.whiteColors
                                    : AppColors.colors.blackColors),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          registerProfileDetailsWatch.updateHybrid();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 45.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: registerProfileDetailsWatch.isHybrid
                                  ? AppColors.colors.blueColors
                                  : Colors.grey),
                          child: Text(
                            "Hybrid",
                            style: TextStyles.w500.copyWith(
                                fontSize: 14.sp,
                                color: registerProfileDetailsWatch.isHybrid
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
