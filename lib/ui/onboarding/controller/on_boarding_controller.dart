

import 'package:emploiflutter/ui/authentication/auth_intro.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/theme/theme.dart';

final onBoardingController = ChangeNotifierProvider((ref) => OnBoardingController());

class OnBoardingController extends ChangeNotifier{
  PageController pageController = PageController();

  int index= 0;
  setPage(int i) {
    pageController.animateToPage(i, duration: const Duration(milliseconds: 200), curve:
    Curves.easeIn);
    index = i;
    notifyListeners();
  }

  nextButton(BuildContext context){
    index ++;
    pageController.animateToPage(index,duration: const Duration(milliseconds: 200), curve:
    Curves.easeIn);
    if(index == 4){
      Navigator.pushAndRemoveUntil(context, PageTransition(child: const AuthIntro(), type: PageTransitionType.leftToRight,duration: const Duration(milliseconds: 600)), (route) => false);
      index = 0;
    }
    notifyListeners();
  }


  onPageChange(int i){
    index = i;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
}