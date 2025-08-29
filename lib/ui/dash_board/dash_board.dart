import 'package:emploihunt/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploihunt/ui/utils/constant/app_constant.dart';

import '../../frame_work/controller/dash_board_controller/dash_board_controller.dart';
import '../../frame_work/repository/services/ze_go_cloud_service/ze_go_cloud_service.dart';
import '../utils/common_dialogs.dart';
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
    // ZeGoCloudService.service.onUserLogin(user);
    print("-------------------------------------------Dash Board User Details-----------------------------------------------");
    print(user.user.vFirebaseId.toString());
    print(user.user.tUpadatedAt);
    print(user.user.id);
    print(user.user.iRole);
    print(user.user.vFirstName);
    print(user.user.vLastName);
    print(user.user.tProfileUrl);
    print(user.tDeviceToken);
    print(user.tAuthToken);
  }
  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final dashBoardWatch  = ref.watch(dashBoardController);
    final userData = BoxService.boxService.userGetDetailBox.get(userDetailKey);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async{
        showCloseAppDialog(context);
      },
      child: Scaffold(
        body: userData!.user.iRole  == 0 ? dashBoardWatch.jobSeekerPages[dashBoardWatch.selectedIndex] : dashBoardWatch.recruiterPages[dashBoardWatch.selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.colors.clayColors,
          unselectedItemColor: AppColors.colors.blueColors,
          items: userData.user.iRole  == 0?
          [
             const BottomNavigationBarItem(
               icon: Icon(Icons.home), label: "Home"
             ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.location_city_outlined ), label: "Campus"
            ),
            ///Temporary stop fetching data
            const BottomNavigationBarItem(
                icon: Icon(Icons.rocket ), label: "AI"
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"
            ),
          ]:
          [
            const BottomNavigationBarItem(
               icon: Icon(Icons.home),
               label: "Home"
             ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.add_box_sharp),
                label: "Post"
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
      ),
    );
  }
}
