import 'package:emploiflutter/ui/utils/theme/theme.dart';

final recruiterHomeController = ChangeNotifierProvider((ref) => RecruiterHomeController());

class RecruiterHomeController extends ChangeNotifier{


  bool isSearchFiledVisible = false;
  updateIsSearchFiledVisible(){
    isSearchFiledVisible = !isSearchFiledVisible;
    notifyListeners();
  }

}