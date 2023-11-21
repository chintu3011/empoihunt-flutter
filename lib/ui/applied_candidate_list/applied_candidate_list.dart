import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class AppliedCandidateList extends StatelessWidget {
  const AppliedCandidateList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Applied Candidate List"),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(AppAssets.jobSearch,height: 200.h,color: AppColors.colors.clayColors,),
            Text("Opps! No Any jobs post",textAlign: TextAlign.center, style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),),
            const Spacer()
          ],
        ).paddingHorizontal(10.h),
      ),
    );
  }
}
