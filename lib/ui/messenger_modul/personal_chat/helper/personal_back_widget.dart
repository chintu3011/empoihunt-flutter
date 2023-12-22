import 'package:emploiflutter/frame_work/controller/messenger_modul_controller/Personal_chat_controller/personal_chat_controller.dart';
import 'package:emploiflutter/frame_work/repository/model/messenger_model/message_data_model.dart';
import 'package:emploiflutter/ui/utils/app_constant.dart';
import 'package:emploiflutter/ui/utils/extension/widget_extension.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:emploiflutter/frame_work/repository/services/hive_service/box_service.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';
import 'chat_bubble.dart';

class PersonalChatBackWidget extends ConsumerStatefulWidget {

  final String personName;
  final String chatPersonFId;
  const PersonalChatBackWidget({super.key,required this.personName,required this.chatPersonFId});

  @override
  ConsumerState<PersonalChatBackWidget> createState() => _PersonalChatBackWidgetState();
}

class _PersonalChatBackWidgetState extends ConsumerState<PersonalChatBackWidget> {



  @override
  void initState() {
    super.initState();
    scrollToBottom();
  }

  @override
  void dispose() {
 scrollController.dispose();
    super.dispose();
  }
  ScrollController scrollController = ScrollController();

  void scrollToBottom()async {
    await Future.delayed(const Duration(milliseconds: 600));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final personalChatWatch = ref.watch(personalChatController);
    final size = MediaQuery.of(context).size;
    final currentUserFId = BoxService.boxService.userGetDetailBox.get(userDetailKey)!.user.vFirebaseId;

    return Column(children: [
      Container(
        width: size.width.w,
        padding: EdgeInsets.only(left: 100.w, top: 40.h, bottom: 15.h),
        color: AppColors.colors.clayColors,
        child: Text(
          widget.personName,
          style: TextStyles.w400
              .copyWith(fontSize: 18.sp, color: AppColors.colors.whiteColors),
        ),
      ),
      Expanded(
        child: FirebaseAnimatedList(
          controller: scrollController,
          query: FirebaseDatabase.instance.ref('Mess').child("userMessages").child(currentUserFId).child(widget.chatPersonFId),
          itemBuilder: (context, snapshot, animation, index) {
            final messageData = MessageDataModel.fromSnapshot(snapshot);
            return ChatBubble(chat: messageData, chatPersonFId: widget.chatPersonFId,);
          },
        )
      ),


      Row(children: [
        Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r)),
            elevation: 20,
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
                    size: 30.sp,
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
          onPressed: ()async {
            if(personalChatWatch.isSendButtonOn){
                personalChatWatch.sendDataToDatabase(chatPersonFId: widget.chatPersonFId);
                await Future.delayed(const Duration(milliseconds: 200)); // Add a delay
                setState(() {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                  );
                });
            }else{

            }
          },
          icon: Icon(
            personalChatWatch.isSendButtonOn?Icons.send: Icons.mic,
            size: 22.sp,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.grey,
              elevation: 20,
              backgroundColor: AppColors.colors.blueColors,
              padding: EdgeInsets.all(12.sp)),
        )
      ]).paddingOnly(left: 6.w,right: 6.w,bottom: 6.h)
    ]);
  }
}
