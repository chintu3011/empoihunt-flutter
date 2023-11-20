import 'package:emploiflutter/ui/utils/theme/theme.dart';

final homeController = ChangeNotifierProvider((ref) => HomeController());

class HomeController extends ChangeNotifier{

  final homeShowCaseKey = GlobalKey();
  final appbarIconShowcase = GlobalKey();
}