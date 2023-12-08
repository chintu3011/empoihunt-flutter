import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/campus_placement_model/campus_placement_model.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../../ui/utils/app_constant.dart';
import '../../repository/api_end_point.dart';
import '../../repository/dio_client.dart';
import '../../repository/services/hive_service/box_service.dart';

final campusPlacementController = ChangeNotifierProvider((ref) => CampusPlacementController());

class CampusPlacementController extends ChangeNotifier{


  bool isSearchFiledVisible = false;
  updateIsSearchFiledVisible(){
    isSearchFiledVisible = !isSearchFiledVisible;
    notifyListeners();
  }

  final searchController = TextEditingController();


  List<CampusPlacementModel> campusPlacementList = [];
  int? totalPages;
  int currentPage= 1;
  bool isLoading = false;

  Future campusPlacementApiCall()async{
    try{
      campusPlacementList=[];
      isLoading = true;
      notifyListeners();
      loadMoreData = false;
      currentPage = 1;
      final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
      if(user !=null) {
        Options options = Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user.tAuthToken}',
            }
        );
        Response response =await DioClient.client.getDataWithBearerToken("${APIEndPoint.campusPlacementApi}&tag=""&current_page=$currentPage", options);
        if(response.statusCode == 200){
          isLoading = false;
          currentPage += 1;
          print(response.data["data"]);
          List responseData = response.data["data"];
          totalPages = response.data["total_pages"];
          for(dynamic i in responseData){
            CampusPlacementModel jobPostModel = CampusPlacementModel.fromJson(i);
            campusPlacementList.add(jobPostModel);
          }
          notifyListeners();
          // print("List Data $jobPostList");
        }
      }
    }catch(e) {
      isLoading = false;
      Future.error(e);
    }
    notifyListeners();
  }

  ///----------------------------------- Fetch more data from api -----------------------------------------------///
  bool loadMoreData = false;

  Future<void> fetchItems() async {
    if(currentPage <= totalPages!) {
      loadMoreData = true;
      notifyListeners();
      try {
        final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
        if (user != null) {
          Options options = Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer ${user.tAuthToken}',
              }
          );
          Response response =await DioClient.client.getDataWithBearerToken("${APIEndPoint.jobPostApi}&tag=${searchController.text}&current_page=$currentPage", options);
          if (response.statusCode == 200) {
            loadMoreData = false;
            List responseData = response.data["data"];
            if (responseData.isNotEmpty) {
              for (dynamic i in responseData) {
                CampusPlacementModel jobPostModel = CampusPlacementModel.fromJson(i);
                campusPlacementList.add(jobPostModel);
              }
              currentPage ++;
            }
          }
        }
      } catch (e) {
        loadMoreData = false;
        Future.error(e);
      }
      loadMoreData = false;
    }
    notifyListeners();
  }
  ///-------------------------------------- Fetch more data from api -----------------------------------------------///

  bool isShowAllTheJobRole = true;
  updateIsShowAllTheJobRole(){
    isShowAllTheJobRole = !isShowAllTheJobRole;
    return isShowAllTheJobRole;
  }

  List<String> getQualification(String qualification){
    List<String> value = qualification.split(",");
    return value;
  }

  List<Map<String,dynamic>> getJobRoleList(String string){
    List<Map<String, dynamic>> jobRoleList =[];
    List<String> firstSlit = string.split(",");
    List<String> secondSplit =[];
    List<String> third =[];

    List<String> jobRole = [];
    List<String> vacancy = [];
    for(String i in firstSlit){
      // print(i);
      secondSplit = i.split("-");
      jobRole.add(secondSplit[0]);
      // print(secondSplit[0]);
      third = secondSplit[1].split("");
      vacancy.add(third[1]);
      // print(third[1]);
      jobRoleList.add({
        "role":secondSplit[0],
        "vacancy":third[1],
      });
    }
    // print(jobRole);
    // print(vacancy);
  return jobRoleList;
  }
}

