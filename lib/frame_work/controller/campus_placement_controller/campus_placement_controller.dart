import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/campus_placement_model/campus_placement_model.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:speech_to_text/speech_to_text.dart';

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
          Response response =await DioClient.client.getDataWithBearerToken("${APIEndPoint.campusPlacementApi}&tag=""&current_page=$currentPage", options);
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


  ///------------------------------------- placement Applied --------------------------------////
  //
  // bool isApplied = false;
  //
  // intAppliedValue(){
  //   isApplied = false;
  //   notifyListeners();
  // }

  Future appliedApi(String campusId,BuildContext context)async{
    try{
      final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
      if(user !=null) {
        Options options = Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user.tAuthToken}',
            }
        );
        Response response =await DioClient.client.postDataWithBearerToken("${APIEndPoint.campusPlacementAppliedApi}$campusId",options);
        if(response.statusCode == 200){
          // isApplied = true;
          print("Successfully applied ----campus placement");
          if(context.mounted){
          context.pop();
          campusPlacementApiCall();
          }
          print(response.data);
        }}
    }catch(e){
      // isApplied = false;
      Future.error(e);
    }
    notifyListeners();
  }

  ///------------------------------------- placement Applied --------------------------------////





  ///---------------------------------------- Search Feature ----------------------------------------///

  ///------------- text to speech --------------///
  final SpeechToText speechToText = SpeechToText();

  listeningVoice(BuildContext context)async{
    isVoiceListening= true;
    if(isVoiceListening) {
      final available = await speechToText.initialize();
      if (available) {
        speechToText.listen(
          onResult: (result) {
            searchController.text = result.recognizedWords;
            notifyListeners();
            if (result.finalResult) {
              isVoiceListening= false;
              context.pop();
              Future.delayed(const Duration(milliseconds: 800), () {
                searchedData();
              });
            }else{
              isVoiceListening= false;
              speechToText.stop();
            }
          },
          listenMode: ListenMode.search,
        );
      } else {
        speechToText.stop();
        isVoiceListening= false;
        notifyListeners();
      }
    } else {
      speechToText.stop();
      isVoiceListening= false;
      notifyListeners();
    }
    notifyListeners();
  }

  bool isVoiceListening= false;
  dialogCancelButton(){
    isVoiceListening = false;
    speechToText.stop();
    notifyListeners();
  }

  ///------------- text to speech --------------///

  Future searchedData()async{
    print("Search function call");
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
        Response response =await DioClient.client.getDataWithBearerToken("${APIEndPoint.campusPlacementApi}&tag=${searchController.text}&current_page=$currentPage", options);
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
          print("List Data $campusPlacementList");
          searchController.clear();
        }
      }
    }catch(e) {
      isLoading = false;
      searchController.clear();
      Future.error(e);
    }
    notifyListeners();

  }

  ///---------------------------------------- Search Feature ----------------------------------------///

  bool isShowAllTheJobRole = false;
  int selectedJobRoleIndex = -1;
  updateIsShowAllTheJobRole(int index,){
    isShowAllTheJobRole = !isShowAllTheJobRole;
    selectedJobRoleIndex = index;
    if(isShowAllTheJobRole){
      if(selectedJobRoleIndex != index){
        selectedJobRoleIndex = -1;
      }
    }

    notifyListeners();
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

