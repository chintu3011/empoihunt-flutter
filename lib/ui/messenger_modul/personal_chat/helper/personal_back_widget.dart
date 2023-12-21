import 'package:emploiflutter/frame_work/controller/messenger_modul_controller/Personal_chat_controller/personal_chat_controller.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import '../../../utils/theme/app_color.dart';
import '../../../utils/theme/text_styles.dart';
import '../model/chat_model.dart';
import 'chat_bubble.dart';

class PersonalChatBackWidget extends ConsumerWidget {
  final String personName;
  const PersonalChatBackWidget({super.key,required this.personName});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final personalChatWatch = ref.watch(personalChatController);
    final size = MediaQuery.of(context).size;

    return Column(children: [
      Container(
        width: size.width.w,
        padding: EdgeInsets.only(left: 100.w, top: 35.h, bottom: 15.h),
        color: AppColors.colors.clayColors,
        child: Text(
          personName,
          style: TextStyles.w400
              .copyWith(fontSize: 18.sp, color: AppColors.colors.whiteColors),
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 48.h,),
              ...List.generate(chats.length, (index) {
                final chat = chats[index];
                return ChatBubble(chat: chat);
              })
            ],
          ),
        ),
      ),


      Row(children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r)),
            elevation: 6,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.colors.whiteColors,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: TextFormField(
                controller: personalChatWatch.inputController,
                onChanged: (value){
                  personalChatWatch.updateIsSendButtonOn(value);
                },
                decoration: InputDecoration(
                  hintText: "Message",
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                    onPressed:(){
                    },
                    icon: Icon(
                      Icons.add,
                    size: 35.sp,
                    color: AppColors.colors.blueColors,
                  ),),
                  // contentPadding: EdgeInsets.symmetric(horizontal: 6.w,vertical:1.h)
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 3.w),
        IconButton(
          onPressed: () {
            if(personalChatWatch.isSendButtonOn){

            }else{

            }
          },
          icon: Icon(
            personalChatWatch.isSendButtonOn?Icons.send: Icons.mic,
            size: 22.sp,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.colors.blueColors,
              padding: EdgeInsets.all(15.sp)),
        )
      ]).paddingHorizontal(6.w)
    ]);
  }
}



List<ChatModel> chats = [

  ChatModel(message: "Of course, let me know if you're on your way", time: "10.18", isUser: false),
  ChatModel(message: "K, I'm on my way", time: "10.18", isUser: true),
  ChatModel(message: "Good morning, did you sleep well?", time: "10.18", isUser: false),
  ChatModel(message: "Yessss!", time: "10.18", isUser: true),
  ChatModel(message: "Of course, let me know if you're on your way", time: "10.18", isUser: false),
  ChatModel(message: "K, I'm on my way", time: "10.18", isUser: true),
  ChatModel(message: "Good morning, did you sleep well?", time: "10.18", isUser: false),
  ChatModel(message: "Yessss!", time: "10.18", isUser: true),
  ChatModel(message: "Of course, let me know if you're on your way", time: "10.18", isUser: false),
  ChatModel(message: "K, I'm on my way", time: "10.18", isUser: true),
  ChatModel(message: "Good morning, did you sleep well?", time: "10.18", isUser: false),
  ChatModel(message: "Yessss!", time: "10.18", isUser: true),
  ChatModel(message: "Of course, let me know if you're on your way", time: "10.18", isUser: false),
  ChatModel(message: "K, I'm on my way", time: "10.18", isUser: true),
  ChatModel(message: "Good morning, did you sleep well?", time: "10.18", isUser: false),
  ChatModel(message: "Yessss!", time: "10.18", isUser: true),
];