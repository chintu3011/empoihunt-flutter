import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class AppliedCandidateAboutTile extends ConsumerWidget {
  const AppliedCandidateAboutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return   Card(
      color: AppColors.colors.whiteColors,
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(6.r)),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r)),
          title: Text(
            "About",
            style: TextStyles.w500.copyWith(
                fontSize: 16.sp,
                color: AppColors.colors.blackColors),
          ),
          subtitle: Text(
            "content goes here ",
            style: TextStyles.w500.copyWith(
                fontSize: 14.sp,
                color: AppColors.colors.greyRegent),
          ),
        ),
      ),
    );
  }
}
