import 'package:emploiflutter/ui/MessengerModul/personal_chat/model/chat_model.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../../../utils/theme/text_styles.dart';

class ChatBubble extends StatelessWidget {
  final ChatModel chat;

  const ChatBubble({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          chat.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 275),
          margin: EdgeInsets.only(top: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          decoration: BoxDecoration(
              color: chat.isUser ? AppColors.colors.clayColors : AppColors.colors.blueColors,
              borderRadius: BorderRadius.only(
                topRight:
                    chat.isUser ? Radius.circular(0.r) : Radius.circular(16.r),
                topLeft:
                    chat.isUser ? Radius.circular(16..r) : Radius.circular(0.r),
                bottomRight: Radius.circular(16.r),
                bottomLeft: Radius.circular(16.r),
              )),
          child: Column(
            crossAxisAlignment:
                chat.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(chat.message,
                  style: TextStyles.w400.copyWith(
                      fontSize: 12.sp,
                      color:Colors.white
                         )),
              Text(chat.time,
                  style: TextStyles.w400.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.colors.greyRegent
                          ))
            ],
          ),
        ),
      ],
    );
  }
}
