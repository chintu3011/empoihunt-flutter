import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

showSnackBar({required BuildContext context, required String error}) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r))),
    content: Text(
      error,
      style: TextStyles.w600.copyWith(fontSize: 14.sp, color: AppColors.colors.whiteColors),
    ),
    backgroundColor: AppColors.colors.clayColors,
    duration: const Duration(seconds: 2),
  ));
}

void appCommonShowToast(
    {required BuildContext context, SnackBarAction? action, required String msg}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(msg),
      action: action ?? SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}