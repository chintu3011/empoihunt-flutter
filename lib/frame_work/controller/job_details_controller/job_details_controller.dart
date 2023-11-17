import 'package:emploiflutter/ui/utils/theme/theme.dart';

final jobDetailsController = ChangeNotifierProvider((ref) => JobDetailsController());

class JobDetailsController extends ChangeNotifier{
  final ScrollController scrollController = ScrollController();
  double offset = 0.0;

  updateOffSetValue(double value){
    offset = value;
    notifyListeners();
  }

}