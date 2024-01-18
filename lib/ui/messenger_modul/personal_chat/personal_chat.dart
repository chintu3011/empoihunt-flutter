import 'package:cached_network_image/cached_network_image.dart';
import 'package:emploiflutter/ui/messenger_modul/personal_chat/helper/personal_back_widget.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/common_widget/common_profile_image_viewer.dart';
import '../../utils/theme/text_styles.dart';

class PersonalChat extends ConsumerStatefulWidget {
  final String profileUrl;
  final String personName;
  final String chatPersonFId;
  final String phone;
  final String? chatPersonDeviceToken;
  const PersonalChat({super.key, this.chatPersonDeviceToken,required this.profileUrl,required this.personName,required this.chatPersonFId,required this.phone});

  @override
  ConsumerState<PersonalChat> createState() => _PersonalChatState();
}

class _PersonalChatState extends ConsumerState<PersonalChat> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.colors.clayColors));
    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          shadowColor: Colors.grey,
          backgroundColor: AppColors.colors.clayColors,
          toolbarHeight: 68.h,
          centerTitle: false,
          leading: IconButton(onPressed: (){
            context.pop();
          },
          icon: Icon(Icons.arrow_back,color: AppColors.colors.whiteColors,),),
          title: Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>CommonImageViewer(imageUrl: "https://api.emploihunt.com${widget.profileUrl}")));
                },
                child: Container(
                  height: 50.h,
                  width: 50.w,
                  // margin: EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.all(1.5.sp),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: AppColors.colors.whiteColors,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child:CachedNetworkImage(
                          imageUrl: "https://api.emploihunt.com${widget.profileUrl}",
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),fit: BoxFit.fill
                      )
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  widget.personName,
                  style: TextStyles.w400
                      .copyWith(fontSize: 16.sp, color: AppColors.colors.whiteColors),overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: (){
              Future.delayed(const Duration(milliseconds: 700),()async{
                await launchUrl(Uri(
                    scheme: 'tel',
                    path: widget.phone
                ));
              });
            }, icon: Icon(Icons.call,color: AppColors.colors.whiteColors,size: 22.sp,))
          ],
        ),
        body: PersonalChatBackWidget(personName:widget.personName, chatPersonFId: widget.chatPersonFId, chatPersonDeviceToken: widget.chatPersonDeviceToken??"",),
      ),
    );
  }
}
