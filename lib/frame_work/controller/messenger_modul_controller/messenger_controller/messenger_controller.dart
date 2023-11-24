import 'package:emploiflutter/ui/utils/theme/theme.dart';

final messengerController = ChangeNotifierProvider((ref) => MessengerController());

class MessengerController extends ChangeNotifier{


  bool isSearchFiledVisible = false;
  updateIsSearchFiledVisible(){
    isSearchFiledVisible = !isSearchFiledVisible;
    notifyListeners();
  }
}