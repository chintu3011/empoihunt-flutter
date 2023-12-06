import 'package:emploiflutter/ui/home/helper/job_seeker/helper/job_seeker_list_card.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../utils/theme/text_styles.dart';

class ViewApplyList extends StatelessWidget {
  const ViewApplyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Applied job",
          style: TextStyles.w400
              .copyWith(fontSize: 16.sp, color: AppColors.colors.blackColors),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
          child: const Column(
          //     children: List.generate(jobsLists.length, (index) {
          //   final jobList = jobsLists[index];
          //   return JobSeekerListCard(
          //     homeJobDetailModel: jobList,
          //   );
          // })
          ),
        ),
      ),
    );
  }
}