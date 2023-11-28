import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices{

  SharedPrefServices._();

  static final SharedPrefServices services = SharedPrefServices._();
  late SharedPreferences pref;

  Future<void> init()async{
   pref = await SharedPreferences.getInstance();
  }

  Future<void> setBool(String key,bool value)async{
    pref.setBool(key, value);
  }

  bool getBool(String key){
    return pref.getBool(key) ?? false;
  }


  Future<void> setString(String key,String value)async{
    await pref.setString(key, value);
  }

  String getString(String key,){
    return pref.getString(key)?? "<Loading>";
  }

  Future<void> setList(String key,List<String> list)async{
    await pref.setStringList(key, list);
  }

  List<String>? getList(String key,){
   return pref.getStringList(key)?? [];
  }

}