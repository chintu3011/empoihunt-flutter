import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class CampusAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CampusAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Campus Placement",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
      actions: [
        IconButton(onPressed: (){}, icon:  Icon(Icons.search,color: AppColors.colors.blackColors,)),
        IconButton(onPressed: (){}, icon:  Icon(Icons.mic,color: AppColors.colors.blackColors,)),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
