import 'package:emploiflutter/frame_work/controller/manage_job_post_controller/manage_job_post_controller.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class UpdatePostBottomButton extends ConsumerWidget {
  const UpdatePostBottomButton({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final manageJobPostWatch = ref.watch(manageJobPostController);
    return Row(
      children: [
        Expanded(child: CommonButton(onPressed: (){
          manageJobPostWatch.updateButton(context);
        }, btnText: "Update",txtPadding: EdgeInsets.symmetric(vertical: 8.h),backgroundColor: AppColors.colors.blueColors,textColor: AppColors.colors.whiteColors,fontSize: 18.sp,)),
        SizedBox(width:8.w,),
        Expanded(child: CommonButton(onPressed: (){
          context.pop();
        }, btnText: "Cancel Post",txtPadding: EdgeInsets.symmetric(vertical: 8.h),backgroundColor: AppColors.colors.blueColors,textColor: AppColors.colors.whiteColors,fontSize: 18.sp,)),
      ],
    );
  }
}
