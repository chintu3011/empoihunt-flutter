// ignore_for_file: deprecated_member_use

import 'package:emploiflutter/ui/utils/theme/theme.dart';
import '../theme/app_color.dart';
import '../theme/text_styles.dart';

class CommonButton extends StatelessWidget {
  final EdgeInsetsGeometry? txtPadding;
  final String btnText;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final OutlinedBorder? shape;
  final void Function() onPressed;
  const CommonButton({super.key,  this.txtPadding, required this.btnText, this.backgroundColor, this.textColor, this.fontSize, this.shape, required this.onPressed, });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style:  ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            backgroundColor: backgroundColor ?? AppColors.colors.blueColors,
            shape: shape,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r),side: const BorderSide(color: Colors.white,width: 1.5))
        ),
        child: Padding(
          padding: txtPadding ?? EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
          child: Text(btnText,style: TextStyles.w400.copyWith(fontSize:fontSize?? 22.sp,color:textColor ?? Colors.white),),
        ));
  }
}
