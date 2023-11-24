import 'package:emploiflutter/ui/utils/theme/theme.dart';

final jobSeekerHomeController = ChangeNotifierProvider((ref) => JobSeekerHomeController());

class JobSeekerHomeController extends ChangeNotifier{


  bool isSearchFiledVisible = false;
  updateIsSearchFiledVisible(){
    isSearchFiledVisible = !isSearchFiledVisible;
    notifyListeners();
  }
}