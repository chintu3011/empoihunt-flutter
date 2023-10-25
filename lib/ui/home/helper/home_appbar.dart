import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../utils/theme/app_color.dart';
import '../../utils/theme/text_styles.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:  Text("Find Best jobs Here",style: TextStyles.w400.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
      actions: [
        IconButton(onPressed: (){}, icon:  Icon(Icons.search,color: AppColors.colors.blackColors,)),
        IconButton(onPressed: (){}, icon:  Icon(Icons.mic,color: AppColors.colors.blackColors,)),
        IconButton(onPressed: (){}, icon:  Icon(Icons.filter_alt_sharp,color: AppColors.colors.blackColors,)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
