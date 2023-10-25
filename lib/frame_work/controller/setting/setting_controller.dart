import 'package:emploiflutter/ui/utils/theme/theme.dart';

final settingController = ChangeNotifierProvider((ref) => SettingController());

class SettingController extends ChangeNotifier{



  List<Map<String,dynamic>> settingList=[
    {"Icon": Icons.person,"Text":"View ApplyList"},
    {"Icon": Icons.app_settings_alt,"Text":"Job Preference"},
    {"Icon": Icons.save,"Text":"Save Job"},
    {"Icon": Icons.phone,"Text":"Contact Us"},
    {"Icon": Icons.security,"Text":"Privacy Policy"},
    {"Icon": Icons.menu_book_rounded,"Text":"Terms & Condition"},
  ];
}