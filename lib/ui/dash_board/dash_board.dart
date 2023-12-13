import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/choose_user_role_controller/choose_user_role_controller.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';

import '../../frame_work/controller/dash_board_controller/dash_board_controller.dart';
import '../utils/theme/app_color.dart';
import '../utils/theme/theme.dart';

class DashBoard extends ConsumerStatefulWidget {
  const DashBoard({super.key});

  @override
  ConsumerState<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends ConsumerState<DashBoard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = BoxService.boxService.userGetDetailBox.get(userDetailKey)!;
    print("-------------------------------------------Dash Board User Details-----------------------------------------------");
    print(user.user.vFirebaseId.toString());
    print(user.user.tUpadatedAt);
    print(user.user.id);
    print(user.user.iRole);
    print(user.user.vFirstName);
    print(user.user.vLastName);
    print(user.user.tProfileUrl);
    print(user.tAuthToken);
  }
  @override
  Widget build(BuildContext context) {
    final dashBoardWatch  = ref.watch(dashBoardController);
    final userData = BoxService.boxService.userGetDetailBox.get(userDetailKey);
    return Scaffold(
      body: userData!.user.iRole  == 0 ? dashBoardWatch.jobSeekerPages[dashBoardWatch.selectedIndex] : dashBoardWatch.recruiterPages[dashBoardWatch.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.colors.clayColors,
        unselectedItemColor: AppColors.colors.blueColors,
        items: [
           const BottomNavigationBarItem(
             icon: Icon(Icons.home),
             label: "Home"
           ),
          BottomNavigationBarItem(
              icon: Icon(userData.user.iRole == 0?Icons.location_city_outlined : Icons.add_box_sharp),
              label: userData.user.iRole  == 0? "Campus": "Post"
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setting"
          ),
        ],
        showUnselectedLabels: false,
        currentIndex: dashBoardWatch.selectedIndex,
        onTap: (index){
          dashBoardWatch.updateSelectedIndex(index);
        },
      ),
    );
  }
}
