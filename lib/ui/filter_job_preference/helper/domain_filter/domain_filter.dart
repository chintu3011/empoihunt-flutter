import 'package:emploiflutter/frame_work/controller/filter_job_preference/filter_job_preference_controller.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

class DomainFilter extends ConsumerWidget {
  const DomainFilter({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final filterJobPrefWatch = ref.watch(filterJobPreferenceController);
    return SingleChildScrollView(
      child: Wrap(
          spacing: 10,
          runSpacing: 5,
          children: List.generate(
            growable: true,
              filterJobPrefWatch.domainList.length,
                  (index) {
                final filter = filterJobPrefWatch.domainList[index];
                return Padding(
                  padding:  EdgeInsets.only(top: 8.h),
                  child: FilterChip(
                      label: Text(filter),
                    onSelected: (selected) {
                        filterJobPrefWatch.addDomainToList(index: index,selected: selected, value: filter,);
                    },
                    selected: index == filterJobPrefWatch.selectedFilterDomainIndex,
                      ),
                );
              })),
    );
  }
}
