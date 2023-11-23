import 'package:emploiflutter/frame_work/controller/filter_job_preference/filter_job_preference_controller.dart';
import 'package:emploiflutter/ui/filter_job_preference/helper/domain_filter/domain_filter.dart';
import 'package:emploiflutter/ui/filter_job_preference/helper/filter_job_preference_appbar.dart';
import 'package:emploiflutter/ui/filter_job_preference/helper/location_filter/location_filter.dart';
import 'package:emploiflutter/ui/filter_job_preference/helper/mode_filter/mode_filter.dart';
import 'package:emploiflutter/ui/filter_job_preference/helper/package_filter/package_filter.dart';
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
      body: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            filterJobPrefWatch.selectedValue[0].value.isNotEmpty || filterJobPrefWatch.selectedValue[1].value.isNotEmpty || filterJobPrefWatch.selectedValue[2].value.isNotEmpty || filterJobPrefWatch.selectedValue[3].value.isNotEmpty?
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                    filterJobPrefWatch.selectedValue.length, (index) {
                  final selected = filterJobPrefWatch.selectedValue[index];
                  return selected.value.isNotEmpty? Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                      margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color:AppColors.colors.blueColors
                      ),
                      child: Text(selected.value,style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.whiteColors),)):const SizedBox();
                }),
              ),
            ) :const SizedBox(),
            Row(
            children: [
              SizedBox(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                child:  TabBar(
                  isScrollable: true,
                  indicatorColor: AppColors.colors.clayColors,
                  labelColor: AppColors.colors.clayColors,
                  unselectedLabelColor: AppColors.colors.blackColors,
                  tabs:  [
                    Tab(child: Container(padding: EdgeInsets.symmetric(horizontal: 6.w),child: const Text("Domain"))),
                    Tab(child: Container(padding: EdgeInsets.symmetric(horizontal: 6.w),child: const Text("Location"))),
                    Tab(child: Container(padding: EdgeInsets.symmetric(horizontal: 6.w),child: const Text("Mode"))),
                    Tab(child: Container(padding: EdgeInsets.symmetric(horizontal: 6.w),child: const Text("Package"))),
                  ],
                ),
              ),
              const Spacer()
            ],
          ),
            const Expanded(
              child: SizedBox(
                child: TabBarView(
                    children: [
                  DomainFilter(),
                  LocationFilter(),
                  ModeFilter(),
                  PackageFilter()
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
