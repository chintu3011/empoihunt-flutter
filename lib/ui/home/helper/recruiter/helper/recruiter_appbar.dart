import 'package:emploiflutter/frame_work/controller/home_controller/recruiter_home_controller/recruiter_home_controller.dart';
import 'package:emploiflutter/ui/filter_job_preference/filter_job_preference.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_search_appbar.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

import 'recruiter_home_search_dialog.dart';

class RecruiterAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const RecruiterAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recruiterHomeWatch = ref.watch(recruiterHomeController);
    return recruiterHomeWatch.isSearchFiledVisible
        ? CommonSearchAppBar(
      controller: recruiterHomeWatch.searchController,
      onFieldSubmitted: (value){
        recruiterHomeWatch.searchedData();
      },
      action: [
            IconButton(
                onPressed: () {
                  recruiterHomeWatch.listeningVoice(context);
                  showDialog(context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Dialog(
                        child: RecruiterHomeSearchDialog(),
                      );
                    },);
                },
                icon: Icon(Icons.mic, color: AppColors.colors.blackColors)),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const FilterJobPreference()));
                },
                icon: Icon(
                Icons.filter_alt_sharp,
                color: AppColors.colors.blackColors,
          ))

    ], searchSuffixClick: () {
      recruiterHomeWatch.searchController.clear();
    }, onBackArrowTap: (){
      recruiterHomeWatch.searchController.clear();
      recruiterHomeWatch.getJobSeekerApiCall();
      recruiterHomeWatch.updateIsSearchFiledVisible();
    },)
        : Theme(
            data: ThemeData(useMaterial3: false),
            child: AppBar(
              backgroundColor: AppColors.colors.whiteColors,
              elevation: 4,
              shadowColor: Colors.grey.shade300,
              title: Text(
                      "Find Best Employees",
                      style: TextStyles.w500.copyWith(
                          fontSize: 16.sp, color: AppColors.colors.blackColors)),
              actions: [
                IconButton(
                        onPressed: () {
                          recruiterHomeWatch.updateIsSearchFiledVisible();
                        },
                        icon: Icon(
                          Icons.search,
                          color: AppColors.colors.blackColors,
                        )),
                IconButton(
                    onPressed: () {
                      recruiterHomeWatch.listeningVoice(context);
                      showDialog(context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const Dialog(
                            child: RecruiterHomeSearchDialog(),
                          );
                        },);
                    },
                    icon: Icon(
                      Icons.mic,
                      color: AppColors.colors.blackColors,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>const FilterJobPreference()));
                    },
                    icon: Icon(
                      Icons.filter_alt_sharp,
                      color: AppColors.colors.blackColors,
                    ))
              ],
            ),
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}