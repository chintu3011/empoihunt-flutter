import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/register_profile_details_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_dropdown_form_field.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/app_string_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class RegisterProfileDetails2ForExperience extends ConsumerWidget {
  const RegisterProfileDetails2ForExperience({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerProfileDetailsWatch =
        ref.watch(registerProfileDetailsController);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Column(
        children: [
          Text(
            "Current Position Details",
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
                    const CommonFormField(
                        hintText: "Company name",
                        prefixIcon: Icon(
                          Icons.location_city_sharp,
                        ),
                        labelText: "Company name"),
                    SizedBox(
                      height: 15.h,
                    ),
                    CommonDropDownFormField(
                      items: designationList,
                      searchController: registerProfileDetailsWatch
                          .designationSearchController,
                      onChanged: (value) {
                        registerProfileDetailsWatch
                            .updateSelectedDesignation(value);
                      },
                      hintTextForDropdown: "Designation",
                      hintTextForField: "Designation",
                      selectedValue:
                          registerProfileDetailsWatch.selectedDesignation,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    CommonDropDownFormField(
                      items: SharedPrefServices.services.getList(locationKey)??["No data"],
                      searchController: registerProfileDetailsWatch
                          .jobLocationSearchController,
                      onChanged: (value) {
                        registerProfileDetailsWatch
                            .updateSelectedJobLocation(value);
                      },
                      hintTextForDropdown: "Job Location",
                      hintTextForField: "Job Location",
                      selectedValue:
                      registerProfileDetailsWatch.selectedJobLocation,
                    )                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
