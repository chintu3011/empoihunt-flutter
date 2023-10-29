import 'package:emploiflutter/frame_work/controller/filter_job_preference/filter_job_preference_controller.dart';
import 'package:emploiflutter/ui/filter_job_preference/helper/filter_job_preference_appbar.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../utils/theme/text_styles.dart';

class FilterJobPreference extends ConsumerStatefulWidget {
  const FilterJobPreference({super.key});

  @override
  ConsumerState<FilterJobPreference> createState() => _FilterJobPreferenceState();
}

class _FilterJobPreferenceState extends ConsumerState<FilterJobPreference> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    ref.read(filterJobPreferenceController).tabController = TabController(length: 4, vsync: this,animationDuration: const Duration(milliseconds: 500));
  }
  @override
  Widget build(BuildContext context) {
    final filterJobPrefWatch = ref.watch(filterJobPreferenceController);
    return  Scaffold(
      appBar: const FilterJobPreferenceAppBar(),
      body: Column(
        children: [
          SizedBox(height: 30.h,),
          DefaultTabController(
            length: 4,
            child: Column(
              children: [
              Row(
                children: [
                  SizedBox(
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                    child:  TabBar(
                      tabAlignment: TabAlignment.fill,
                      indicatorColor: AppColors.colors.clayColors,
                      labelColor: AppColors.colors.clayColors,
                      unselectedLabelColor: AppColors.colors.blackColors,
                      tabs: const[
                        Tab(text: "Domain",),
                        Tab(text: "Location",),
                        Tab(text: "Mode",),
                        Tab(text: "Package",),
                      ],
                    ),
                  ),
                  const Spacer()
                ],
              ),
                SizedBox(
                  height: 500,
                  child: TabBarView(children: [
                    Container(),
                    Container(),
                    Container(),
                    Container(),
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
