import 'package:emploiflutter/frame_work/controller/filter_job_preference/filter_job_preference_controller.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class ModeFilter extends ConsumerWidget {
  const ModeFilter({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final filterJobPrefWatch = ref.watch(filterJobPreferenceController);
    return Wrap(
        spacing: 10,
        runSpacing: 5,
        children: List.generate(filterJobPrefWatch.modeList.length,
                (index) {
              final filter = filterJobPrefWatch.modeList[index];
              return Padding(
                padding:  EdgeInsets.only(top: 8.h),
                child: FilterChip(
                  label: Text(filter),
                  onSelected: (selected) {
                    filterJobPrefWatch.addModeToList(index: index,selected: selected, value: filter);
                  },
                  selected: index == filterJobPrefWatch.selectedFilterModeIndex,
                ),
              );
            }));
  }
}
