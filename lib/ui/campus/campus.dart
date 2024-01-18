import 'package:emploiflutter/frame_work/controller/campus_placement_controller/campus_placement_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/campus_job_details_model/campus_job_detail_model.dart';
import 'package:emploiflutter/ui/campus/helper/campus_detail_card.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/scheduler.dart';

import '../utils/common_widget/common_no_data_found_layout.dart';
import '../utils/theme/app_assets.dart';
import 'helper/campus_placement_appbar.dart';

class Campus extends ConsumerStatefulWidget {
  const Campus({super.key});

  @override
  ConsumerState<Campus> createState() => _CampusState();
}

class _CampusState extends ConsumerState<Campus> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(campusPlacementController).campusPlacementApiCall();
    });
    debugPrint("Campus Placement init call");
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        ref.read(campusPlacementController).fetchItems();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final campusPlacementWatch = ref.watch(campusPlacementController);
    return Scaffold(
      appBar: const CampusPlacementAppbar(),
      body: RefreshIndicator(
        onRefresh:()async{
          await Future.delayed(const Duration(microseconds: 200));
          campusPlacementWatch.campusPlacementApiCall();
        },
        child:campusPlacementWatch.isLoading? const Center(child: CircularProgressIndicator(),) :
        campusPlacementWatch.campusPlacementList.isEmpty? const Center(child: CommonNoDataFoundLayout(img:  AppAssets.jobSearch, errorTxt: 'Sorry! at this moment no any campus placement are available',)):
        SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
            child:  Column(
                children: List.generate(
                    campusPlacementWatch.loadMoreData?
                    campusPlacementWatch.campusPlacementList.length +1:
                    campusPlacementWatch.campusPlacementList.length, (index) {
                  if(index < campusPlacementWatch.campusPlacementList.length){
                   final campusJobDetail = campusPlacementWatch.campusPlacementList[index];
                   return  CampusDetailCard(campusJobDetailModel: campusJobDetail,index);
                   }else{
                    return  const Center(child: CircularProgressIndicator());

                  }
                })
            ),
          ),
        ),
      ),
    );
  }
}



List<CampusJobDetailModel> campusJobDetails= [
  CampusJobDetailModel(companyName: "Amri Systems",address: "501,PNTC, Radio mirchi road, ahmedabad", date: "21-5-2023", tableData: [
    CampusDetailTableModel(jobRole: "Android Developer", vacancy: 2),
    CampusDetailTableModel(jobRole: "web Developer", vacancy: 1),
  ], qualification: [
    "BE","MCA","Diploma","Bsc"
  ]),
  CampusJobDetailModel(companyName: "Parth Institute",address: "501,PNTC, Radio mirchi road, ahmedabad", date: "14-10-2023", tableData: [
    CampusDetailTableModel(jobRole: "Flutter Developer", vacancy: 5),
    CampusDetailTableModel(jobRole: "Full Stack Developer", vacancy: 1),
  ], qualification: [
    "BE","MCA","Diploma","Bsc"
  ]),
  CampusJobDetailModel(companyName: "Hackers Systems",address: "501,PNTC, Radio mirchi road, ahmedabad", date: "05-5-2023", tableData: [
    CampusDetailTableModel(jobRole: "Ethical hacking", vacancy: 2),
    CampusDetailTableModel(jobRole: "Cyber security Developer", vacancy: 1),
  ], qualification: [
    "BE","MCA","Diploma","Bsc"
  ]),
];