import 'dart:io';

import 'package:emploiflutter/frame_work/repository/model/splash/native_device_model/native_device_model.dart';
import 'package:emploiflutter/frame_work/repository/services/box_service.dart';
import 'package:emploiflutter/frame_work/repository/services/shared_pref_services.dart';
import 'package:emploiflutter/ui/splash/splash.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  ///--------- initialize Share preference --------///
  await SharedPrefServices.services.init();

  /// ------- Hive open Box Service ---------///
  await Hive.initFlutter();
  Hive.registerAdapter(NativeDeviceDetailModelAdapter());
  BoxService.boxService.nativeDeviceBox = await Hive.openBox<NativeDeviceDetailModel>(nativeDeviceDetailsBox);
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
