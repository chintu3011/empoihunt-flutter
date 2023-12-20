import 'package:emploiflutter/frame_work/controller/home_controller/recruiter_home_controller/recruiter_home_controller.dart';
import 'package:emploiflutter/ui/home/helper/recruiter/helper/recruiter_appbar.dart';
import 'package:emploiflutter/ui/home/helper/recruiter/helper/recruiter_list_tile.dart';
import 'package:emploiflutter/ui/messenger_modul/messenger/messanger.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/common_widget/common_no_data_found_layout.dart';
import '../../../utils/theme/app_assets.dart';

class RecruiterHome extends ConsumerStatefulWidget {
  const RecruiterHome({super.key});

  @override
  ConsumerState<RecruiterHome> createState() => _RecruiterHomeState();
}

class _RecruiterHomeState extends ConsumerState<RecruiterHome> {
  final ScrollController _scrollController = ScrollController();
  GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(recruiterHomeController).getJobSeekerApiCall();
    });
    debugPrint("Recruiter Home init call");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Fetch more items when reaching the end of the list
        ref.read(recruiterHomeController).fetchItems();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    final recruiterHomeWatch = ref.watch(recruiterHomeController);
    return Scaffold(
      appBar: const RecruiterAppbar(),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 200));
              recruiterHomeWatch.getJobSeekerApiCall();
            },
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
              child: recruiterHomeWatch.isLoading
                  ? const Center(child: CircularProgressIndicator(),)
                  : recruiterHomeWatch.jobSeekerList.isEmpty ?
              const CommonNoDataFoundLayout(img: AppAssets.jobSearch, errorTxt: 'Opps sorry! jobs not availble at moment',)
                  :
              ListView.builder(
                controller: recruiterHomeWatch.jobSeekerList.length >=20? _scrollController:null,
                physics:recruiterHomeWatch.jobSeekerList.length >=20? const BouncingScrollPhysics():null,
                itemCount:  recruiterHomeWatch.loadMoreData ?
                recruiterHomeWatch.jobSeekerList.length + 1
                    : recruiterHomeWatch.jobSeekerList.length,
                itemBuilder: (context, index) {
                if (index < recruiterHomeWatch.jobSeekerList.length) {
                  final jobSeeker = recruiterHomeWatch.jobSeekerList[index];
                  return RecruiterListTile(user: jobSeeker);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },),
            ),
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
    );
  }
}