import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/recruiter_register_profile_details_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_dropdown_form_field.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/form_validation.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/app_string_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class RecruiterRegisterProfileDetails2 extends ConsumerWidget {
  const RecruiterRegisterProfileDetails2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerProfileDetailsWatch =
        ref.watch(recruiterRegisterProfileDetailsController);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CommonFormField(
                         maxLength: 15,
                         buildCounter: (p0, {required currentLength, required isFocused, maxLength}) =>const SizedBox(),
                       controller: registerProfileDetailsWatch.companyNameController,
                         // autoValidateMode: AutovalidateMode.onUserInteraction,
                         // validator: (val) => requireddFieldValidator(input: val!,errorMgs:"Please Enter company name" ),
                         keyboardType: TextInputType.name,
                         onChanged: (value){
                           registerProfileDetailsWatch.updateIsCompanyEmpty(value);
                           notAllowSpecialChar(registerProfileDetailsWatch.companyNameController, value);
                         },
                        hintText: "Company name",
                        prefixIcon: const Icon(
                          Icons.location_city_sharp,
                        ),
                        labelText: "Company name"),
                    registerProfileDetailsWatch.isCompanyEmpty?Text("please enter the company name",style: TextStyles.w300.copyWith(fontSize: 12.sp,color: Colors.red),):const SizedBox(),
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
                    registerProfileDetailsWatch.isDesignationEmpty?Text("please Select the above Designation",style: TextStyles.w300.copyWith(fontSize: 12.sp,color: Colors.red),):const SizedBox(),
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
                    ),
                    registerProfileDetailsWatch.isJobLocationEmpty? Text("please Select the Job Location",style: TextStyles.w300.copyWith(fontSize: 12.sp,color: Colors.red),):const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
