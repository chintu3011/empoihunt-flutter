import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/api_end_point.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/job_post_model/job_post_model.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final jobSeekerHomeController = ChangeNotifierProvider((ref) => JobSeekerHomeController());

class JobSeekerHomeController extends ChangeNotifier{


  bool isSearchFiledVisible = false;
  updateIsSearchFiledVisible(){
    isSearchFiledVisible = !isSearchFiledVisible;
    notifyListeners();
  }


  List<JobPostModel> jobPostList = [];

  bool isLoading = false;

  Future jobsPostApiCall()async{
    try{
      isLoading = true;
        final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
        if(user !=null) {
          Options options = Options(
              headers: {
                'Accept': 'application/json',
                'Authorization': 'Bearer ${user.tAuthToken}',
              }
          );
          Response response =await DioClient.client.getDataWithBearerToken(APIEndPoint.jobPostApi, options);
          if(response.statusCode == 200){
            isLoading = false;
            print(response.data["data"]);
            List responseData = response.data["data"];
            for(dynamic i in responseData){
              JobPostModel jobPostModel = JobPostModel.fromJson(i);
              jobPostList.add(jobPostModel);
            }
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

}