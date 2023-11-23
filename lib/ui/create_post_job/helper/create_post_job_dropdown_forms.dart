import 'package:emploiflutter/frame_work/controller/create_post_job_controller/create_post_job_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/app_string_constant.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_dropdown_form_field.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class CreatePostJobDropDownForms extends ConsumerWidget {
  const CreatePostJobDropDownForms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createPostJobWatch = ref.watch(createPostJobController);

    return Column(
      children: [
        CommonDropDownFormField(
          items: qualificationsList,
          searchController: createPostJobWatch.qualificationSearchController,
          selectedValue: createPostJobWatch.selectedQualification,
          onChanged: (value) {
            createPostJobWatch.updateSelectedQualification(value);
          },
          hintTextForDropdown: 'Qualification',
          hintTextForField: 'Qualification',
        ),
        SizedBox(
          height: 10.h,
        ),
        CommonDropDownFormField(
          items: SharedPrefServices.services.getList(locationKey)??["No data"],
          searchController: createPostJobWatch.jobLocationSearchController,
          onChanged: (value) {
            createPostJobWatch.updateSelectedJobLocation(value);
          },
          hintTextForDropdown: "Job Location",
          hintTextForField: "Job Location",
          selectedValue: createPostJobWatch.selectedJobLocation,
        ),
      ],
    );
  }
}
