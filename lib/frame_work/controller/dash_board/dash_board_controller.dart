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
    const Center(child: Text("Campus"),),
    const Center(child: Text("Setting"),),
  ];
}