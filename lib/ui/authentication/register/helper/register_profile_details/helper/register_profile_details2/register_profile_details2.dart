import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/register_profile_details_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class RegisterProfileDetails2 extends ConsumerWidget {
  const RegisterProfileDetails2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerProfileDetailsWatch =
        ref.watch(registerProfileDetailsController);
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
                  children: [
                    DropdownButtonFormField(
                      dropdownColor: AppColors.colors.whiteColors,
                      value: registerProfileDetailsWatch.jobTitle,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.colors.blueColors,
                      ),
                      items: registerProfileDetailsWatch.jobTitleList.map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e))).toList(),
                      onChanged: (value){
                        registerProfileDetailsWatch.updateSelectedJobTitle(value);
                      },
                      decoration:  InputDecoration(
                          hintText: "Job Title",
                          hintStyle: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors)
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    DropdownButtonFormField(
                      dropdownColor: AppColors.colors.whiteColors,
                      value: registerProfileDetailsWatch.preferCity,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.colors.blueColors,
                      ),
                      items: registerProfileDetailsWatch.preferCityList.map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e))).toList(),
                      onChanged: (value){
                        registerProfileDetailsWatch.updateSelectedPreferCity(value);
                      },
                      decoration:  InputDecoration(
                          hintText: "Prefer City",
                          hintStyle: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors)
                      ),
                    )
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
