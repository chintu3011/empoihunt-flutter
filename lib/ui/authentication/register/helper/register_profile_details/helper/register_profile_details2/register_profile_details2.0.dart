import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/register_profile_details_controller.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class RegisterProfileDetails20 extends ConsumerWidget {
  const RegisterProfileDetails20({super.key});

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
                    const CommonFormField(hintText: "Company name",prefixIcon: Icon(Icons.location_city_sharp,),labelText: "Company name"),
                    SizedBox(height: 15.h,),
                    DropdownButtonFormField(
                      dropdownColor: AppColors.colors.whiteColors,
                      value: registerProfileDetailsWatch.designation,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.colors.blueColors,
                      ),
                      items: registerProfileDetailsWatch.designationList.map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e))).toList(),
                      onChanged: (value){
                        registerProfileDetailsWatch.updateSelectedDesignation(value);
                      },
                      decoration:  InputDecoration(
                          hintText: "Designation",
                          hintStyle: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors)
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    DropdownButtonFormField(
                      dropdownColor: AppColors.colors.whiteColors,
                      value: registerProfileDetailsWatch.jobLocation,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.colors.blueColors,
                      ),
                      items: registerProfileDetailsWatch.jobLocationList.map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e))).toList(),
                      onChanged: (value){
                        registerProfileDetailsWatch.updateSelectedJobLocation(value);
                      },
                      decoration:  InputDecoration(
                          hintText: "Job Location",
                          hintStyle: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors)
                      ),
                    )
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
