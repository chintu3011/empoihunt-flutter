import 'package:emploiflutter/frame_work/controller/applied_candidate_list_controller/applied_job_controller.dart';
import 'package:emploiflutter/ui/applied_candidate_list/helper/applied_candidate_list_tile.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_appbar.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class AppliedCandidateList extends ConsumerWidget {
  const AppliedCandidateList({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appliedCandidateWatch = ref.watch(appliedCandidateListController);
    return Scaffold(
      appBar: const CommonAppBar(title: "Applied Candidate List"),
      body: Column(
        children: [
          PopupMenuButton(
            onSelected: (value){
              appliedCandidateWatch.updateSelectedPostJob(value);
            },
            surfaceTintColor: AppColors.colors.whiteColors,
            padding: EdgeInsets.only(right: 500.w),
            color: AppColors.colors.whiteColors,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: AppColors.colors.blueDark,width: 1.w),
              ),
              child: Text(appliedCandidateWatch.selectedPostJob,style: TextStyles.w400.copyWith(fontSize: 14.sp, color: AppColors.colors.blueColors),),
            ),
            itemBuilder: (context) {
            return List.generate(appliedCandidateWatch.postJobList.length, (index){
              final list = appliedCandidateWatch.postJobList[index];
              return  PopupMenuItem(
                value: list,
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration:  BoxDecoration(
                      color: AppColors.colors.whiteColors,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(list,style: TextStyles.w400.copyWith(fontSize: 14.sp, color: AppColors.colors.blueColors),),
                  ),
                ),
              );
            });
          },).paddingSymmetric(horizontal: 10.w,vertical: 12.h),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
                child: Column(
                    children:
                    List.generate(10, (index) {
                      return const AppliedCandidateListTile();
                    })
                ) ,
              ),
            ),
          )
        ],
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       const Spacer(),
      //       Image.asset(AppAssets.jobSearch,height: 200.h,color: AppColors.colors.clayColors,),
      //       Text("Opps! No Any jobs post",textAlign: TextAlign.center, style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),),
      //       const Spacer()
      //     ],
      //   ).paddingHorizontal(10.h),
      // ),
    );
  }
}
