import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';

import '../theme/theme.dart';

class CommonNoDataFoundLayout extends StatelessWidget {
  final String img;
  final String errorTxt;
  const CommonNoDataFoundLayout({super.key, required this.img, required this.errorTxt});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        Image.asset(img,color: AppColors.colors.clayColors),
         Text(errorTxt),
        const Expanded(child: SizedBox()),
      ],
    ).paddingHorizontal(20.w);
  }
}
