import 'package:emploiflutter/ui/utils/theme/theme.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/theme/text_styles.dart';

class FilterJobPreferenceAppBar extends StatelessWidget implements PreferredSizeWidget{
  const FilterJobPreferenceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2.5,
      shadowColor: Colors.grey.shade300,
      title:  Text("Filter job Preference",style: TextStyles.w400.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
      actions: [
        IconButton(onPressed: (){}, icon:  Icon(Icons.check,color: AppColors.colors.blackColors,)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
