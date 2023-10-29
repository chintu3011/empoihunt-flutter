import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/api_end_point.dart';
import 'package:emploiflutter/frame_work/repository/dio_client.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final termsPrivacyPolicyController = ChangeNotifierProvider((ref) => TermsPrivacyPolicyController());

class TermsPrivacyPolicyController extends ChangeNotifier{



   String termHtmlString = "<p>Loading</p>";
  Future termsApiRequest()async{
    try{
      Response response = await DioClient.client.getData(APIEndPoint.termsAndCondition);
      if(response.statusCode == 200){
        // print(response);
        final data = jsonEncode(response.data["data"]["content"]);
        termHtmlString = data;
        notifyListeners();
        // print("HtmlString $termHtmlString");
      }
    }catch(e){
      Future.error(e);
    }
  }


   String privacyPolicyHtmlString = "<p>Loading</p>";
   Future privacyPolicyApiRequest()async{
     try{
       Response response = await DioClient.client.getData(APIEndPoint.privacyPolicy);
       if(response.statusCode == 200){
         // print(response);
         final data = jsonEncode(response.data["data"]["content"]);
         privacyPolicyHtmlString = data;
         notifyListeners();
       }
     }catch(e){
       Future.error(e);
     }
   }

}