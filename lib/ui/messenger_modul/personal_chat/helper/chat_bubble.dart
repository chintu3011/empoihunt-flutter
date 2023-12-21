import 'package:emploiflutter/frame_work/repository/model/messenger_model/message_data_model.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../../utils/theme/text_styles.dart';

class ChatBubble extends ConsumerStatefulWidget {
  final String chatPersonFId;
  final MessageDataModel chat;

  const ChatBubble({super.key, required this.chat,required this.chatPersonFId});

  @override
  ConsumerState<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends ConsumerState<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    final currentUserId = BoxService.boxService.userGetDetailBox.get(userDetailKey)!.user.vFirebaseId;
    return Row(
      mainAxisAlignment:
          widget.chat.fromId ==  currentUserId ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 275),
          margin: EdgeInsets.only(top: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: widget.chat.fromId ==  currentUserId ? AppColors.colors.clayColors : AppColors.colors.blueColors,
              borderRadius: BorderRadius.only(
                topRight:
                widget.chat.fromId ==  currentUserId ?  Radius.circular(0.r) : Radius.circular(16.r),
                topLeft:
                widget.chat.fromId ==  currentUserId ?  Radius.circular(16..r) : Radius.circular(0.r),
                bottomRight: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              )),
          child: Column(
            crossAxisAlignment:
            widget.chat.fromId ==  currentUserId ?  CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(widget.chat.message,
                  style: TextStyles.w400.copyWith(
                      fontSize: 12.sp,
                      color:Colors.white
                         )),
              Text(widget.chat.timeStamp,
                  style: TextStyles.w400.copyWith(
                      fontSize: 8.sp,
                      color: AppColors.colors.greyRegent
                          ))
            ],
          ),
        ),
      ],
    ).paddingHorizontal(4.w);
  }
}
