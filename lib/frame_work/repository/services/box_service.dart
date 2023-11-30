import 'package:emploiflutter/frame_work/repository/model/splash/native_device_model/native_device_model.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:hive/hive.dart';

class BoxService{
  late Box<NativeDeviceDetailModel> nativeDeviceBox;
  
  BoxService._private();
  static BoxService boxService = BoxService._private();

  Future<void> addDataToHive(dynamic key,NativeDeviceDetailModel deviceDetail)async{
    //this will add data to the hive with specific key
    await nativeDeviceBox.put(key,deviceDetail);
    //this will add data to hive and it will automatically generate key value of that
    // await boxNote.add(userNote);
  }

  Future<void> deleteData(int index)async{
    await nativeDeviceBox.deleteAt(index);
  }

  Future<void> updateData(int key,NativeDeviceDetailModel deviceDetail)async{
    final box = Hive.box(nativeDeviceDetailsBox);
    // ignore: unrelated_type_equality_checks
    box.values.toList().indexWhere((element) => (element as NativeDeviceDetailModel).deviceId == key);
    await nativeDeviceBox.putAt(key, deviceDetail);
  }


  // List<UserNote> searchUserNotes(String query){
  //     return boxNote.values.toList().where((note) => note.title.toLowerCase().contains(query.toLowerCase())).toList();
  // }
}