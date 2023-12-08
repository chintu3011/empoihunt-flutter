import 'package:emploiflutter/frame_work/controller/campus_placement_controller/campus_placement_controller.dart';
import 'package:emploiflutter/ui/campus/helper/campus_placement_search_dialog.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_search_appbar.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class CampusPlacementAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CampusPlacementAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campusPlacementWatch = ref.watch(campusPlacementController);
    return campusPlacementWatch.isSearchFiledVisible
        ? CommonSearchAppBar(
      controller: campusPlacementWatch.searchController,
      onFieldSubmitted: (value){
        campusPlacementWatch.searchedData();
      },action: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.mic, color: AppColors.colors.blackColors)),
    ], searchSuffixClick: () {
      campusPlacementWatch.searchController.clear();
    }, onBackArrowTap: (){
      campusPlacementWatch.searchController.clear();
      campusPlacementWatch.campusPlacementApiCall();
      campusPlacementWatch.updateIsSearchFiledVisible();
    },)
        : Theme(
            data: ThemeData(useMaterial3: false),
            child: AppBar(
              backgroundColor: AppColors.colors.whiteColors,
              elevation: 4,
              shadowColor: Colors.grey.shade300,
              title: Text(
                      "Campus Placement",
                      style: TextStyles.w500.copyWith(
                          fontSize: 16.sp, color: AppColors.colors.blackColors)),
              actions: [
                IconButton(
                        onPressed: () {
                          campusPlacementWatch.updateIsSearchFiledVisible();
                        },
                        icon: Icon(
                          Icons.search,
                          color: AppColors.colors.blackColors,
                        )),
                IconButton(
                    onPressed: () {
                      campusPlacementWatch.listeningVoice(context);
                      showDialog(context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const Dialog(
                            child: CampusPlacementSearchDialog(),
                          );
                        },);

                    },
                    icon: Icon(
                      Icons.mic,
                      color: AppColors.colors.blackColors,
                    )),],
            ),
          );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}