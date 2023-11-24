import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool isLeadingShow;
  const CommonAppBar({super.key, required this.title, this.actions, this.leading, this.isLeadingShow = false});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(useMaterial3: false),
      child: AppBar(
        leading: isLeadingShow? leading?? IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.colors.blackColors,),
          onPressed: () {
            context.pop();
          },
        ):null,
        backgroundColor: AppColors.colors.whiteColors,
        elevation: 4,
        shadowColor: Colors.grey.shade300,
        title: Text(title,style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
