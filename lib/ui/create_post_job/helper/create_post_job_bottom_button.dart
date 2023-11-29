import 'package:emploiflutter/frame_work/controller/create_post_job_controller/create_post_job_controller.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class CreatePostJobBottomButton extends ConsumerWidget {
  const CreatePostJobBottomButton({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final createJobWatch = ref.watch(createPostJobController);
    return Row(
      children: [
        Expanded(child: CommonButton(onPressed: (){
          createJobWatch.postButton();
          // if(createJobWatch.formKey.currentState!.validate()){
          //   Text("validation");
          // }else{
          //   Text("not");
          // }
        }, btnText: "Post Job",txtPadding: EdgeInsets.symmetric(vertical: 8.h),backgroundColor: AppColors.colors.blueColors,textColor: AppColors.colors.whiteColors,fontSize: 18.sp,)),
        SizedBox(width:8.w,),
        Expanded(child: CommonButton(onPressed: (){
          createJobWatch.cancelButton();
        }, btnText: "Cancel Post",txtPadding: EdgeInsets.symmetric(vertical: 8.h),backgroundColor: AppColors.colors.blueColors,textColor: AppColors.colors.whiteColors,fontSize: 18.sp,)),
      ],
    );
  }
}
