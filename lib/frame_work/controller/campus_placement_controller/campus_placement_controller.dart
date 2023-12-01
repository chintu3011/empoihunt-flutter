import 'package:emploiflutter/ui/utils/theme/theme.dart';

final campusPlacementController = ChangeNotifierProvider((ref) => CampusPlacementController());

class CampusPlacementController extends ChangeNotifier{


  bool isSearchFiledVisible = false;
  updateIsSearchFiledVisible(){
    isSearchFiledVisible = !isSearchFiledVisible;
    notifyListeners();
  }
}