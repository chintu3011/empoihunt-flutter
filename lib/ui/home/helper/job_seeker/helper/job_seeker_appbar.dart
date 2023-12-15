import 'package:emploiflutter/frame_work/controller/home_controller/job_seeker_home_controller/job_seeker_home_controller.dart';
import 'package:emploiflutter/ui/filter_job_preference/filter_job_preference.dart';
import 'package:emploiflutter/ui/home/helper/job_seeker/helper/job_seeker_home_search_dialog.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_search_appbar.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class JobSeekerAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const JobSeekerAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobSeekerHomeWatch = ref.watch(jobSeekerHomeController);
    return jobSeekerHomeWatch.isSearchFiledVisible
        ? CommonSearchAppBar(
          controller: jobSeekerHomeWatch.searchController,
          onFieldSubmitted: (value){
              jobSeekerHomeWatch.searchedData();
          },
          action: [
            IconButton(
                onPressed: () {
                  jobSeekerHomeWatch.listeningVoice(context);
                  showDialog(context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return const Dialog(
                        child: JobSeekerHomeSearchDialog(),
                      );
                    },);
                },
                icon: Icon(Icons.mic, color: AppColors.colors.blackColors)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                Icons.filter_alt_sharp,
                color: AppColors.colors.blackColors,
          ))

    ], searchSuffixClick: () {
            jobSeekerHomeWatch.searchController.clear();
    }, onBackArrowTap: (){
              jobSeekerHomeWatch.searchController.clear();
              jobSeekerHomeWatch.jobsPostApiCall();

      jobSeekerHomeWatch.updateIsSearchFiledVisible();
    },)
        : Theme(
            data: ThemeData(useMaterial3: false),
            child: AppBar(
              backgroundColor: AppColors.colors.whiteColors,
              elevation: 4,
              shadowColor: Colors.grey.shade300,
              title: Text(
                      "Find Job here",
                      style: TextStyles.w500.copyWith(
                          fontSize: 16.sp, color: AppColors.colors.blackColors)),
              actions: [
                IconButton(
                        onPressed: () {
                          jobSeekerHomeWatch.updateIsSearchFiledVisible();
                        },
                        icon: Icon(
                          Icons.search,
                          color: AppColors.colors.blackColors,
                        )),
                IconButton(
                    onPressed: () {
                       jobSeekerHomeWatch.listeningVoice(context);
                       showDialog(context: context,
                        barrierDismissible: false,
                        builder: (context) {
                        return const Dialog(
                          child: JobSeekerHomeSearchDialog(),
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