import 'package:emploiflutter/frame_work/controller/filter_job_preference/filter_job_preference_controller.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class PackageFilter extends ConsumerWidget {
  const PackageFilter({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final filterJobPrefWatch = ref.watch(filterJobPreferenceController);
    return SingleChildScrollView(
      child: Wrap(
          spacing: 8,
          runSpacing: 3,
          children: List.generate(filterJobPrefWatch.packageList.length,
                  (index) {
                final filter = filterJobPrefWatch.packageList[index];
                return FilterChip(
                  label: Text("$filter LPA+"),
                  onSelected: (selected) {
                    filterJobPrefWatch.addPackageToList(index: index,selected: selected, value: filter.toString());
                  },
                  selected: index == filterJobPrefWatch.selectedFilterPackageIndex,
                );
              })),
    );
  }
}
