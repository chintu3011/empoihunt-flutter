import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';

import '../theme/theme.dart';

class CommonNoDataFoundLayout extends StatelessWidget {
  const CommonNoDataFoundLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        Image.asset(AppAssets.jobSearch,color: AppColors.colors.clayColors),
        const Text("Opps sorry! jobs not availble at moment"),
        const Expanded(child: SizedBox()),
      ],
    ).paddingHorizontal(20.w);
  }
}
