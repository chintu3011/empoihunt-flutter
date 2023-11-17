import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../../utils/theme/text_styles.dart';


class MakeNewChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MakeNewChatAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2.5,
      shadowColor: Colors.grey.shade300,
      title:  Text("Make New Chat",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
      actions: [
        IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
        IconButton(onPressed: (){}, icon: const Icon(Icons.mic)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
