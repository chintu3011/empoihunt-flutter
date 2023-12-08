import 'package:emploiflutter/frame_work/repository/model/splash/native_device_model/native_device_model.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/splash/splash.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'frame_work/repository/services/hive_service/hive_adapter.dart';


Future<void> main() async{

  String initString =  "Android Developer - 2 (Fresher),Web Developer - 1 (1 Year exp),Flutter Developer - 1 (1 Year exp),.NET Developer - 1 (1 Year exp),Anguler Developer - 1 (1 Year exp)";
  List<String> firstSlit = initString.split(",");
  List<String> secondSplit =[];
  List<String> third =[];

  List<String> jobRole = [];
  List<String> vacancy = [];
  print(firstSlit);
  for(String i in firstSlit){
    print(i);
    secondSplit = i.split("-");
    jobRole.add(secondSplit[0]);
    print(secondSplit[0]);
    third = secondSplit[1].split("");
    vacancy.add(third[1]);
    print(third[1]);
  }
  print(jobRole);
  print(vacancy);


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  ///--------- initialize Share preference --------///
  await SharedPrefServices.services.init();
  await SharedPrefServices.services.pref.setString(fcmTokenKey,fcmToken!);
  print("FCM Token ${SharedPrefServices.services.getString(fcmTokenKey)}");

  /// ------- Hive open Box Service ---------///
  registerHiveAdapters();
  await Hive.initFlutter();
  BoxService.boxService.nativeDeviceBox = await Hive.openBox<NativeDeviceDetailModel>(nativeDeviceDetailsBox);
  BoxService.boxService.userGetDetailBox = await Hive.openBox<UserDetailDataModel>(userDetailsBox);
  BoxService.boxService.userModelBox = await Hive.openBox<UserModel>(userModel);
  runApp(const ProviderScope(child: MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.colors.blueColors),
        ),
        home: const Splash(),
      ),
    );
  }
}
