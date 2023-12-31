import 'package:cached_network_image/cached_network_image.dart';
import 'package:emploiflutter/ui/messenger_modul/personal_chat/helper/personal_back_widget.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';

class PersonalChat extends ConsumerStatefulWidget {
  final String profileUrl;
  final String personName;
  final String chatPersonFId;
  final String? chatPersonDeviceToken;
  const PersonalChat({super.key, this.chatPersonDeviceToken,required this.profileUrl,required this.personName,required this.chatPersonFId});

  @override
  ConsumerState<PersonalChat> createState() => _PersonalChatState();
}

class _PersonalChatState extends ConsumerState<PersonalChat> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.colors.clayColors));
    return  Scaffold(
      body: Stack(
        children: [
           PersonalChatBackWidget(personName:widget.personName, chatPersonFId: widget.chatPersonFId, chatPersonDeviceToken: widget.chatPersonDeviceToken??"",),
          Positioned(
            top: 30.h,
              left: 6.w,
              child: Container(
                height: 90.h,
                width: 90.w,
                padding: EdgeInsets.all(3.sp),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: AppColors.colors.whiteColors,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: 80.h,
                  width: 80.w,
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
              ))
        ],
      ),
    );
  }
}
