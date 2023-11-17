import '../../frame_work/controller/dash_board_controller/dash_board_controller.dart';
import '../utils/theme/app_color.dart';
import '../utils/theme/theme.dart';

class DashBoard extends ConsumerWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final dashBoardWatch  = ref.watch(dashBoardController);
    return Scaffold(
      body: dashBoardWatch.pages[dashBoardWatch.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.colors.clayColors,
        unselectedItemColor: AppColors.colors.blueColors,
        items:const[
           BottomNavigationBarItem(
             icon: Icon(Icons.home),
             label: "Home"
           ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_city_outlined),
              label: "Campus"
          ),
          BottomNavigationBarItem(
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
