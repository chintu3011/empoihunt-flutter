import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:flutter/services.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class CommonFormField extends StatelessWidget {
  const CommonFormField(
      {super.key,
        required this.hintText,
        this.obscureText =false,
        this.suffixIcon,
        this.validator,
        this.initialValue, this.controller, this.textInputAction, this.keyboardType, this.inputFormatters, this.labelText, this.prefixIcon, this.maxLength});

  final String hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      initialValue: initialValue,
      controller: controller,
      textInputAction: textInputAction,
      obscuringCharacter: "*",
      obscureText: obscureText,
      keyboardType: keyboardType,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyles.w400.copyWith(fontSize: 14.sp),
      decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          labelText: labelText,
          labelStyle:  TextStyles.w400.copyWith(color: Colors.black,fontSize: 14.sp),
          hintStyle: TextStyles.w400.copyWith(color: Colors.grey,fontSize: 14.sp),
          contentPadding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 0),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.w)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.5.w)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.5.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.5.w)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.w)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.w))),
      validator: validator,
    );
  }
}
