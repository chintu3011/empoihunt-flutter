import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/api_end_point.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/frame_work/repository/model/applied_candidate_list_model/applied_candidate_experience_model.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../../ui/utils/app_constant.dart';
import '../../repository/services/hive_service/box_service.dart';

final appliedCandidateProfileController = ChangeNotifierProvider((ref) => AppliedCandidateProfileController());

class AppliedCandidateProfileController extends ChangeNotifier{


  bool isLoading = false;
  List<AppliedCandidateExperienceModel> experienceList = [];
  Future getExperienceByIdApi(String jUserId) async{
    try{
      experienceList = [];
      isLoading = true;
      final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
      Options options = Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${user!.tAuthToken}',
          }
      );
      
      Response response = await DioClient.client.getDataWithBearerToken("${APIEndPoint.getAppliedUserExpByIdApi}?iUserId=$jUserId", options);
      if(response.statusCode == 200 ){
        isLoading = false;
        final data = response.data["data"];
        for(dynamic i in data){
          AppliedCandidateExperienceModel data = AppliedCandidateExperienceModel.fromJson(i);
          experienceList.add(data);
        }
      }
    }catch(e){
      isLoading = false;
      Future.error(e);
    }
    notifyListeners();
  }
}