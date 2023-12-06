import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/api_end_point.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/ui/job_details/helper/job_details_bottom_sheet.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../../ui/utils/app_constant.dart';
import '../../repository/services/hive_service/box_service.dart';

final jobDetailsController = ChangeNotifierProvider((ref) => JobDetailsController());

class JobDetailsController extends ChangeNotifier{
  final ScrollController scrollController = ScrollController();
  double offset = 0.0;

  updateOffSetValue(double value){
    offset = value;
    notifyListeners();
  }

  bool isApplied = false;
  bool isFavorite = false;

  int applied = 0;

  Future appliedApi(String jobId,BuildContext context,String companyName)async{
    try{
     // Response response =await DioClient.client.getData("${APIEndPoint.jobAppliedApi}$jobId");
      final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
      if(user !=null) {
        Options options = Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user.tAuthToken}',
            }
        );
     Response response =await DioClient.client.getDataWithBearerToken("${APIEndPoint.jobAppliedApi}$jobId",options);
     if(response.statusCode == 200){
       isApplied = true;
       if(context.mounted){
       showModalBottomSheet(
           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
           context: context,
           builder: (context) => JobDetailsBottomSheet(companyName: companyName));
       }
     }}
    }catch(e){
      isApplied = false;
      Future.error(e);
    }
    notifyListeners();
  }


  Future jobSavedApi(String jobId)async{
    try{
      final user = BoxService.boxService.userGetDetailBox.get(userDetailKey);
      if(user !=null) {
        Options options = Options(
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer ${user.tAuthToken}',
            }
        );
        Response response =await DioClient.client.getDataWithBearerToken("${APIEndPoint.saveJobApi}$jobId$jobId",options);
        if(response.statusCode == 200){
          isFavorite = true;
          print("You've saved job");
        }}
    }catch(e){
      isFavorite = false;
      Future.error(e);
    }
    notifyListeners();
  }

}