import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class CreatePostJobDropDownForms extends StatelessWidget {
  const CreatePostJobDropDownForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CommonFormField(hintText: "Required Experience",labelText: "Required Experience",),
        SizedBox(height: 10.h,),
        const CommonFormField(hintText: "Job Location",labelText: "Job Location",),
      ],
    );
  }
}
