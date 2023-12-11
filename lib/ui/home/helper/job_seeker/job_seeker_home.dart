import 'package:emploiflutter/frame_work/controller/home_controller/job_seeker_home_controller/job_seeker_home_controller.dart';
import 'package:emploiflutter/frame_work/controller/job_details_controller/job_details_controller.dart';
import 'package:emploiflutter/ui/home/helper/job_seeker/helper/job_seeker_appbar.dart';
import 'package:emploiflutter/ui/home/helper/job_seeker/helper/job_seeker_list_card.dart';
import 'package:emploiflutter/ui/job_details/job_details.dart';
import 'package:emploiflutter/ui/messenger_modul/messenger/messanger.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_no_data_found_layout.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../../utils/theme/app_assets.dart';
import '../../../utils/theme/text_styles.dart';


class JobSeekerHome extends ConsumerStatefulWidget {
  const JobSeekerHome({super.key});

  @override
  ConsumerState<JobSeekerHome> createState() => _JobSeekerHomeState();
}

class _JobSeekerHomeState extends ConsumerState<JobSeekerHome> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async{
      await ref.read(jobSeekerHomeController).getJobPrefApiCall();
      await ref.read(jobSeekerHomeController).jobsPostApiCall();
    });
    debugPrint("Job seeker Home init call");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent){
        // Fetch more items when reaching the end of the list
        ref.read(jobSeekerHomeController).fetchItems();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    final jobSeekerHomeWatch = ref.watch(jobSeekerHomeController);
    return Scaffold(
      appBar: const JobSeekerAppbar(),
      body: RefreshIndicator(
        onRefresh:()async{
          await Future.delayed(const Duration(microseconds: 200));
          jobSeekerHomeWatch.jobsPostApiCall();
        },
        child: Stack(
          children: [
            Column(
              children: [
                ///----------------------- preference widget ----------------------------///
                jobSeekerHomeWatch.jobPreferenceList.isEmpty? const SizedBox():
                PopupMenuButton(
                  onSelected: (value){
                    jobSeekerHomeWatch.updateSelectedPostJob(value);
                  },
                  surfaceTintColor: AppColors.colors.whiteColors,
                  color: AppColors.colors.whiteColors,
                  child: Card(
                     shadowColor: Colors.grey.withOpacity(0.5),
                    elevation: 6,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.h),
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(jobSeekerHomeWatch.selectedPostJob.keys.first,style: TextStyles.w400.copyWith(fontSize: 14.sp, color: AppColors.colors.blackColors),),
                    ),
                  ),
                  itemBuilder: (context) {
                    return List.generate(jobSeekerHomeWatch.jobPreferenceList.length, (index){
                      final list = jobSeekerHomeWatch.jobPreferenceList[index];
                      return  PopupMenuItem(
                        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w),
                        value: list,
                        child: Container(
                          width: context.size!.width,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(list.keys.first,style: TextStyles.w400.copyWith(fontSize: 14.sp, color: AppColors.colors.blueColors),),
                        ),
                      );
                    });
                  },).paddingOnly(top: 12.h,left: 16.w,right: 16.w),

                ///----------------------- above list widget -----------------///
                Expanded(child:
                jobSeekerHomeWatch.isLoading? const Center(child: CircularProgressIndicator(),) :
                jobSeekerHomeWatch.jobPostList.isEmpty?  const CommonNoDataFoundLayout(img: AppAssets.jobSearch, errorTxt: 'Opps sorry! jobs not availble at moment',):
                SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
                    child: Column(
                        children:
                        List.generate(
                            jobSeekerHomeWatch.loadMoreData?
                            jobSeekerHomeWatch.jobPostList.length +1:
                            jobSeekerHomeWatch.jobPostList.length, (index) {
                          if(index < jobSeekerHomeWatch.jobPostList.length){
                            final jobList = jobSeekerHomeWatch.jobPostList[index];
                            return JobSeekerListCard(
                              jobPostModel: jobList,
                              onTap: () async{
                                if(jobList.iIsApplied != 1){
                                  ref.watch(jobDetailsController).intAppliedValue();
                                }
                                if(jobList.iIsSaved != 1){
                                  ref.watch(jobDetailsController).provideFavoriteValue(false);
                                }else {
                                  ref.watch(jobDetailsController).provideFavoriteValue(true);
                                }
                                await Navigator.push(context,
                                    MaterialPageRoute(builder: (_) =>  JobDetails(jobDetail: jobList,)));
                              },
                            );}else{
                            return  const Center(child: CircularProgressIndicator());
                          }
                        })
                    ) ,
                  ),
                ),)
              ],
            ),

            Positioned(
                right: 0,
                top: 35.h,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Messenger()));
                  },
                  child: Container(
                    height: 80.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                      color: AppColors.colors.clayColors,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          bottomLeft: Radius.circular(16.r)),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}


