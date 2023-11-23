import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class AppliedCandidateQualificationTile extends ConsumerWidget {
  const AppliedCandidateQualificationTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 6,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
            color: AppColors.colors.whiteColors,
            borderRadius: BorderRadius.circular(6.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Qualification",
              style: TextStyles.w500.copyWith(
                  fontSize: 18.sp, color: AppColors.colors.blackColors),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "content Goes here",
              style: TextStyles.w500.copyWith(
                  fontSize: 12.sp, color: AppColors.colors.greyRegent),
            )
          ],
        ),
      ),
    );
  }
}
