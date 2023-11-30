import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:emploiflutter/frame_work/repository/model/splash/native_device_model/native_device_model.dart';
import 'package:emploiflutter/frame_work/repository/model/splash/splashmodel.dart';
import 'package:emploiflutter/frame_work/repository/services/box_service.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import '../../../ui/authentication/auth_intro.dart';
import '../../../ui/onboarding/on_boarding.dart';
import '../../../ui/utils/app_constant.dart';
import '../../repository/api_end_point.dart';
import '../../repository/dio_client.dart';
import '../../repository/services/shared_pref_services.dart';
import 'package:yaml/yaml.dart';


final splashController = ChangeNotifierProvider((ref) => SplashController());


class SplashController extends ChangeNotifier{

  Future<String> getAppVersion() async {
    // Read the contents of the pubspec.yaml file
    String pubspecYamlString = await rootBundle.loadString('pubspec.yaml');

    // Parse the YAML string
    var pubspecYaml = loadYaml(pubspecYamlString);

    // Access the version field in the YAML
    String version = pubspecYaml['version'];

    return version;
  }

  Future getSplashData() async{
    try{
      Response response = await DioClient.client.getData(APIEndPoint.splashUpdateApp);
      if(response.statusCode == 200){
        SplashModel splashData = SplashModel.fromJson(response.data);
        if(splashData.status == 200){
          print(" update api --->>>> ${splashData.data!.nothing!.vName!}");
          String appVersion = await getAppVersion();
          debugPrint("Current App Version ------> $appVersion");
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



 Future getDeviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        print(build.version.release);
        print(build.id);
        print(build.model);
        await BoxService.boxService.addDataToHive(deviceDetailKey, NativeDeviceDetailModel(deviceId: build.id!, deviceName: build.model!, deviceVersion: build.version.release.toString(), deviceType: 0));
      } else if (Platform.isIOS) {
        var iosInfo = await deviceInfoPlugin.iosInfo;
        print("IOS Device ID -----> ${iosInfo.identifierForVendor}");
        print("IOS Device Version -----> ${iosInfo.systemVersion}");
        print("IOS Device Name -----> ${iosInfo.name}");
        // await BoxService.boxService.addDataToHive(deviceDetailKey, NativeDeviceDetailModel(deviceId: build.id!, deviceName: build.model!, deviceVersion: build.version.release.toString(), deviceType: 1));
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }


}