import 'package:emploiflutter/ui/utils/theme/app_color.dart';

import '../../../utils/theme/text_styles.dart';
import '../../../utils/theme/theme.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: 300.h,
        width: 320.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 8.h),
          child: Column(
            children: [
              Text("OTP Verification",style:  TextStyles.w600.copyWith(fontSize: 22.sp,color: Colors.black),),
              Text("we will send you 6-digit one-time password to the number",style:  TextStyles.w300.copyWith(fontSize: 10.sp,color: Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}
