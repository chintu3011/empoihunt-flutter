
import 'package:emploiflutter/ui/MessengerModul/Messenger/helper/messenger_appbar.dart';
import 'package:emploiflutter/ui/MessengerModul/make_new_chat/helper/make_new_chat_appbar.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_assets.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../make_new_chat/make_new_chat.dart';


class Messenger extends StatelessWidget {
  const Messenger({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const MessengerAppbar(),
      floatingActionButton: IconButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.colors.blueDark,
          padding: EdgeInsets.all(20.sp)
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>const MakeNewChat()));
        },icon: Icon(Icons.people,color: AppColors.colors.whiteColors,size: 22,),),
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
                padding: EdgeInsets.symmetric(vertical: 6.h,horizontal: 10.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.colors.whiteColors
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 60.h,
                      width: 60.w,
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle
                      ),
                      child: Image.asset(AppAssets.profilePicPng),
                    ),
                    SizedBox(width: 10.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chintan Patel",style: TextStyles.w400.copyWith(fontSize: 18.sp,color: AppColors.colors.blueColors),),
                        Text("Recent Message",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: AppColors.colors.greyRegent))
                      ],
                    )
                  ],
                ),
              ),
            ).paddingOnly(top: 4.h,left: 6.w,right: 6.w))
          ),
        )
    );
  }
}