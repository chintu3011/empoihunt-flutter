import 'package:emploiflutter/ui/campus/campus.dart';
import 'package:emploiflutter/ui/home/home.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

final dashBoardController = ChangeNotifierProvider((ref) => DashBoardController());

class DashBoardController extends ChangeNotifier{

  int selectedIndex = 0;

  updateSelectedIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> pages = [
    const Home(),
    const Campus(),
    const Center(child: Text("Setting"),),
  ];
}