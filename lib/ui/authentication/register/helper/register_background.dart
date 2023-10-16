import 'package:emploiflutter/ui/authentication/register/helper/register_card.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/theme/theme.dart';

class RegisterBackGround extends StatelessWidget {
  const RegisterBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.56,
              width:  size.width,
              decoration: BoxDecoration(
                  color: AppColors.colors.clayColors,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(100.r))
              ),
              child: Column(
                children: [
                  Image.asset(AppAssets.titleLogoWhite,height: 100.h,width: 350.w,),
                  Image.asset(AppAssets.phoneImg,height: 140.h,width: 270.w,),
                ],
              ),
            ),
            Container(
                height: size.height * 0.4,
                width:  size.width,
                color: Colors.white
            )
          ],
        ),
        const Positioned(child: RegisterCard())
      ],
    );
  }
}
