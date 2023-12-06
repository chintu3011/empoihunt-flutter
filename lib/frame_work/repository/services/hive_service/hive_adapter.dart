import 'package:emploiflutter/frame_work/repository/model/splash/native_device_model/native_device_model.dart';
import 'package:emploiflutter/frame_work/repository/model/user_model/user_detail_data_model.dart';
import 'package:hive/hive.dart';

void registerHiveAdapters() {
  Hive.registerAdapter(NativeDeviceDetailModelAdapter());
  Hive.registerAdapter(UserDetailDataModelAdapter());
  Hive.registerAdapter(UserAdapter());
}