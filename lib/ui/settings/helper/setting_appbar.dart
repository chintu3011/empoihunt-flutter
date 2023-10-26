import 'package:emploiflutter/ui/settings/helper/setting_bottom_sheet.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../utils/theme/text_styles.dart';

class SettingAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2.5,
      shadowColor: Colors.grey.shade300,
      title: Text("Settings",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
      actions: [
        IconButton(onPressed: (){
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              context: context,
              builder: (context) => const SettingBottomSheet());
        }, icon: Icon(Icons.logout_outlined,color: AppColors.colors.blackColors,))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
