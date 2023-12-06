import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/api_end_point.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/frame_work/repository/model/location_list_model/location_list_model.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final authIntroController = ChangeNotifierProvider((ref)=>AuthIntroController());

class AuthIntroController extends ChangeNotifier{


  Future getLocationList() async{
    try{
      Response response = await DioClient.client.getData(APIEndPoint.getLocationsList);
      if(response.statusCode == 200){
        LocationListModel locationList = LocationListModel.fromJson(response.data);
        if(locationList.status == 200){
          // print(locationList.data);
           await SharedPrefServices.services.setList(locationListKey, locationList.data!);
           // print(SharedPrefServices.services.getList(locationKey));
        }
      }else{
        debugPrint(response.statusCode.toString());
      }
    }catch(e){
      Future.error(e);
    }
  }
}