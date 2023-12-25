
import 'package:emploiflutter/frame_work/controller/messenger_modul_controller/Personal_chat_controller/personal_chat_controller.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';

import '../../../utils/theme/app_color.dart';
import '../../../utils/theme/text_styles.dart';
import '../../../utils/theme/theme.dart';

class ChatBottomSheet extends StatelessWidget {
  final String chatPersonId;
  const ChatBottomSheet({super.key,required this.chatPersonId});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      final personalChatWatch = ref.watch(personalChatController);
      return Container(
          height: 350.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  spreadRadius: 0.5,
                )
              ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40.r),topRight: Radius.circular(40.r))
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 24.h),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon:  Icon(Icons.close,color: AppColors.colors.blueColors,)),
                    SizedBox(width: 60.w,),
                    Text("Share Content",style: TextStyles.w500.copyWith(fontSize: 16.sp, color: AppColors.colors.blueColors),)
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                  itemCount: sheetList.length,
                  itemBuilder: (context, index) {
                    final data = sheetList[index];
                    return  Padding(
                      padding:  EdgeInsets.only(bottom: 10.h),
                      child: ListTile(
                        onTap: (){
                          context.pop();
                        if(index == 0){
                          personalChatWatch.pickImageFromCamara(chatPersonId: chatPersonId);
                        }else if(index == 1){
                          personalChatWatch.pickPdfFile(chatPersonId: chatPersonId);
                        }else if(index == 2){
                          personalChatWatch.pickImageFromMedia(chatPersonId: chatPersonId);
                        }
                        },
                        leading:  Icon(data["icon"],color:  AppColors.colors.blueColors,),
                        title: Text(data["title"],style: TextStyles.w600.copyWith(fontSize: 14.sp,color: AppColors.colors.blueColors),),
                        subtitle:data['subtitle']!="" ? Text(data["subtitle"],style: TextStyles.w400.copyWith(fontSize: 12.sp, color: AppColors.colors.greyRegent),): null,
                      ),
                    );

                  },),
                )
              ],
            ),
          )
      );
    },);
  }
}

List<Map<String,dynamic>> sheetList=[
  {
    "icon": Icons.camera_alt,
    "title": "Camara",
    "subtitle": ""
  },
  {
    "icon": Icons.file_copy,
    "title": "Documents",
    "subtitle": "Share your files"
  },
  {
    "icon": Icons.image,
    "title": "Media",
    "subtitle": "Share photos and videos"
  },
];