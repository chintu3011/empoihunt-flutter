import 'package:emploiflutter/ui/utils/theme/theme.dart';

final filterJobPreferenceController = ChangeNotifierProvider((ref) => FilterJobPreferenceController());

class FilterJobPreferenceController extends ChangeNotifier{
  
  late TabController tabController;
}