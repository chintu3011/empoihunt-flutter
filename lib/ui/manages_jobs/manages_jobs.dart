import 'package:emploiflutter/ui/manages_jobs/helper/manage_job_tile.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class ManagesJobs extends StatelessWidget {
  const ManagesJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Manages Jobs",isLeadingShow: true),
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
          child: Column(
              children:
              List.generate(10, (index) {
                return const ManageJobTile();
              })
          ) ,
        ),
      )

        /// show this if the recruiter didn't post any job ///
      // Column(
      //   children: [
      //     const Spacer(),
      //     Image.asset(AppAssets.jobSearch,height: 200.h,color: AppColors.colors.clayColors,),
      //     Text("Ummm... We searched for and wide and couldn't find data matching your search. Let's check with another one",textAlign: TextAlign.center, style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),),
      //     const Spacer(),
      //   ],
      // ).paddingHorizontal(10.h),
    );
  }
}
