import 'package:emploiflutter/ui/authentication/register/helper/register_profile_details/helper/register_profile_details_card_view.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';



class RegisterProfileDetailsBackGround extends StatelessWidget {
  const RegisterProfileDetailsBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.54,
              width:  size.width,
              decoration: BoxDecoration(
                  color: AppColors.colors.clayColors,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(100.r))
              ),
              child: Column(
                children: [
                  Image.asset(AppAssets.titleLogoWhite,height: 100.h,width: 330.w,),
                  Image.asset(AppAssets.phoneImg,height: 140.h,width: 270.w,),
                ],
              ),
            ),
            Container(
                height: size.height * 0.35,
                width:  size.width,
                color: Colors.white
            )
          ],
        ),
        Padding(
          padding:EdgeInsets.only(bottom: 2.h),
          child: const RegisterProfileDetailsCardView(),
        )
      ],
    );
  }
}
