import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/model/splash/splashmodel.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:page_transition/page_transition.dart';
import '../../../ui/authentication/auth_intro.dart';
import '../../../ui/onboarding/on_boarding.dart';
import '../../../ui/utils/app_constant.dart';
import '../../repository/api_end_point.dart';
import '../../repository/dio_client.dart';
import '../../repository/services/shared_pref_services.dart';

final splashController = ChangeNotifierProvider((ref) => SplashController());


class SplashController extends ChangeNotifier{

  Future getSplashData() async{
    try{
      Response response = await DioClient.client.getData(APIEndPoint.splashUpdateApp);
      if(response.statusCode == 200){
        SplashModel splashData = SplashModel.fromJson(response.data);
        if(splashData.status == 200){
          print(splashData.data!.nothing!.vName!);
          // print(SharedPrefServices.services.getList(locationKey));
        }
      }else{
        debugPrint(response.statusCode.toString());
      }
    }catch(e){
      Future.error(e);
    }
  }

  checkUserOpenAppFirstTime(BuildContext context){
    if(SharedPrefServices.services.getBool(onBoardingKey)){
      Navigator.pushReplacement(
          context,
          PageTransition(child: const AuthIntro(), type: PageTransitionType.topToBottom,duration: const Duration(milliseconds: 700))
        // MaterialPageRoute(builder: (context) => const OnBoarding())
      );
    }else{
      Navigator.pushReplacement(
          context,
          PageTransition(child: const OnBoarding(), type: PageTransitionType.topToBottom,duration: const Duration(milliseconds: 700))
      );
    }
    notifyListeners();
  }
}