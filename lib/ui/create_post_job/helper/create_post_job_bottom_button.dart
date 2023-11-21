import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class CreatePostJobBottomButton extends StatelessWidget {
  const CreatePostJobBottomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CommonButton(onPressed: (){}, btnText: "Post Job",txtPadding: EdgeInsets.symmetric(vertical: 8.h),backgroundColor: AppColors.colors.blueColors,textColor: AppColors.colors.whiteColors,fontSize: 18.sp,)),
        SizedBox(width:8.w,),
        Expanded(child: CommonButton(onPressed: (){}, btnText: "Cancel Post",txtPadding: EdgeInsets.symmetric(vertical: 8.h),backgroundColor: AppColors.colors.blueColors,textColor: AppColors.colors.whiteColors,fontSize: 18.sp,)),
      ],
    );
  }
}
