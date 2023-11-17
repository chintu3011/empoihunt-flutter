import 'package:emploiflutter/ui/MessengerModul/make_new_chat/helper/make_new_chat_appbar.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../utils/theme/app_assets.dart';
import '../../utils/theme/app_color.dart';
import '../../utils/theme/text_styles.dart';

class MakeNewChat extends StatelessWidget {
  const MakeNewChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MakeNewChatAppbar(),
        body:
        // Column(
        //   children: [
        //     const Expanded(child: SizedBox(),),
        //     Image.asset(AppAssets.jobSearch,color: AppColors.colors.clayColors,),
        //     Text("Sorry you have no any chats, Please add chat user using below Add People",style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.greyRegent),textAlign: TextAlign.center,),
        //     const Expanded(child: SizedBox(),),
        //   ],
        // ).paddingHorizontal(10.w),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(10, (index) => Card(
                elevation: 6,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.colors.whiteColors
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 25.r,
                      child: Image.asset(AppAssets.profilePicPng),
                    ),
                    title: Text("All Users",style: TextStyles.w400.copyWith(fontSize: 18.sp,color: AppColors.colors.blueColors),),
                    // subtitle: Text("Recent Message",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.greyRegent)),
                  ),
                ),
              ).paddingOnly(top: 6.h,left: 6.w,right: 6.w))
          ),
        )
    );
  }
}
