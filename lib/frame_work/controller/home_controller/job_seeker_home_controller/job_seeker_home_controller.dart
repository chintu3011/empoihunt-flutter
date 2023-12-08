import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/job_post_model/job_post_model.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../repository/api_end_point.dart';

final jobSeekerHomeController = ChangeNotifierProvider((ref) => JobSeekerHomeController());

class JobSeekerHomeController extends ChangeNotifier{


  bool isSearchFiledVisible = false;
  updateIsSearchFiledVisible(){
    isSearchFiledVisible = !isSearchFiledVisible;
    notifyListeners();
  }


  List<JobPostModel> jobPostList = [];
  int? totalPages;
  int currentPage= 1;
  bool isLoading = false;

  Future jobsPostApiCall()async{
    try{
      jobPostList=[];
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
          Response response =await DioClient.client.getDataWithBearerToken("${APIEndPoint.jobPostApi}&tag=""&current_page=$currentPage", options);
          if(response.statusCode == 200){
            isLoading = false;
            currentPage += 1;
            print(response.data["data"]);
            List responseData = response.data["data"];
            totalPages = response.data["total_pages"];
            for(dynamic i in responseData){
              JobPostModel jobPostModel = JobPostModel.fromJson(i);
              jobPostList.add(jobPostModel);
            }
            notifyListeners();
            print("List Data $jobPostList");
            // JobPostModel data = JobPostModel.fromJson(response.data["data"]);
            // print(data);
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
                JobPostModel jobPostModel = JobPostModel.fromJson(i);
                jobPostList.add(jobPostModel);
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




  ///---------------------------------------- Search Feature ----------------------------------------///

  final searchController = TextEditingController();

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
      jobPostList=[];
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
        Response response =await DioClient.client.getDataWithBearerToken("${APIEndPoint.jobPostApi}&tag=${searchController.text}&current_page=$currentPage", options);
        // Response response = await DioClient.dio.get("http://192.168.1.3:5000/api/job/jobs?iJobPreferenceId=0&tag=${searchController.text.trimRight()}&current_page=$currentPage",options: options);
        if(response.statusCode == 200){
          isLoading = false;
          currentPage += 1;
          print(response.data["data"]);
          List responseData = response.data["data"];
          totalPages = response.data["total_pages"];
          for(dynamic i in responseData){
            JobPostModel jobPostModel = JobPostModel.fromJson(i);
            jobPostList.add(jobPostModel);
          }
          notifyListeners();
          print("List Data $jobPostList");
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

///----------------------------------- take epochTime and return how long ago the post is --------------------------///
  String getTimeAgo(int epochTime) {
    final now = DateTime.now().toUtc();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000).toUtc();

    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else {
      final months = difference.inDays ~/ 30;
      return '$months months ago';
    }
  }
///----------------------------------- take epochTime and return how long ago the post is --------------------------///

}