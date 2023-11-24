import 'package:emploiflutter/frame_work/controller/update_post_controller/update_post_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/app_string_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_dropdown_form_field.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class UpdatePostDropDownForms extends ConsumerWidget {
  const UpdatePostDropDownForms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updatePostWatch = ref.watch(updatePostController);

    return Column(
      children: [
        CommonDropDownFormField(
          items: qualificationsList,
          searchController: updatePostWatch.qualificationSearchController,
          selectedValue: updatePostWatch.selectedQualification,
          onChanged: (value) {
            updatePostWatch.updateSelectedQualification(value);
          },
          hintTextForDropdown: 'Qualification',
          hintTextForField: 'Qualification',
        ),
        SizedBox(
          height: 10.h,
        ),
        CommonDropDownFormField(
          items: SharedPrefServices.services.getList(locationKey)??["No data"],
          searchController: updatePostWatch.jobLocationSearchController,
          onChanged: (value) {
            updatePostWatch.updateSelectedJobLocation(value);
          },
          hintTextForDropdown: "Job Location",
          hintTextForField: "Job Location",
          selectedValue: updatePostWatch.selectedJobLocation,
        ),
      ],
    );
  }
}
