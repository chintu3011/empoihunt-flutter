import 'package:emploiflutter/ui/campus/campus.dart';
import 'package:emploiflutter/ui/create_post_job/create_post_job.dart';
import 'package:emploiflutter/ui/home/home.dart';
import 'package:emploiflutter/ui/settings/setting.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final dashBoardController = ChangeNotifierProvider((ref) => DashBoardController());

class DashBoardController extends ChangeNotifier{

  int selectedIndex = 0;

  int userRole = 0;

  updateSelectedIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> jobSeekerPages = [
    const Home(),
    const Campus(),
    const Setting()
  ];

  List<Widget> recruiterPages = [
    const Home(),
    const CreatePostJob(),
    const Setting()
  ];
}