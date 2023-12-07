import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/job_post_model/job_post_model.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

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
  int currentPage= 2;
  bool isLoading = false;

  Future jobsPostApiCall()async{
    try{
      jobPostList=[];
      isLoading = true;
      notifyListeners();
      loadMoreData = false;
      currentPage = 2;
        final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
        if(user !=null) {
          Options options = Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer ${user.tAuthToken}',
              }
          );
          Response response =await DioClient.client.getDataWithBearerToken("${APIEndPoint.jobPostApi}1", options);
          if(response.statusCode == 200){
            isLoading = false;
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
          Response response = await DioClient.client.getDataWithBearerToken(
              "${APIEndPoint.jobPostApi}$currentPage", options);


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
}