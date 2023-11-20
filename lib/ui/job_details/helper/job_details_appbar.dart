import 'package:emploiflutter/frame_work/controller/job_details_controller/job_details_controller.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class JobDetailsAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const JobDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final jobDetailsWatch = ref.watch(jobDetailsController);
    return AppBar(
      elevation: 2.5,
      shadowColor: Colors.grey.shade300,
      backgroundColor: AppColors.colors.whiteColors,
      centerTitle: true,
      title: jobDetailsWatch.offset > 0? Text("Android Developer",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),): const SizedBox(),
      actions: [
        IconButton(onPressed: (){
        }, icon: const Icon(Icons.favorite_border_outlined))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}