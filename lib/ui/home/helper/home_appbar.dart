import 'package:emploiflutter/frame_work/controller/home_controller/home_controller.dart';
import 'package:emploiflutter/ui/filter_job_preference/filter_job_preference.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/theme/text_styles.dart';

class HomeAppbar extends ConsumerWidget implements PreferredSizeWidget{
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final homeWatch = ref.read(homeController);
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2.5,
      shadowColor: Colors.grey.shade300,
      title:  Text("Find Best jobs Here",style: TextStyles.w400.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
      actions: [
        IconButton(onPressed: (){}, icon:  Icon(Icons.search,color: AppColors.colors.blackColors,)),
        IconButton(onPressed: (){}, icon:  Icon(Icons.mic,color: AppColors.colors.blackColors,)),
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const FilterJobPreference()));
        }, icon:  Icon(Icons.filter_alt_sharp,color: AppColors.colors.blackColors,)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
