import 'package:emploiflutter/frame_work/controller/messenger_modul_controller/make_new_chat_controller/make_new_chat_controller.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_search_appbar.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:emploiflutter/ui/utils/theme/text_styles.dart';

class MakeNewChatAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const MakeNewChatAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final makeNewChatWatch = ref.watch(makeNewChatController);
    return makeNewChatWatch.isSearchFiledVisible
        ? CommonSearchAppBar(action: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.mic, color: AppColors.colors.blackColors))
          ], searchSuffixClick: () {}, onBackArrowTap: (){
      makeNewChatWatch.updateIsSearchFiledVisible();
    },)
        : Theme(
            data: ThemeData(useMaterial3: false),
            child: AppBar(
              leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.colors.blackColors,),
                      onPressed: () {
                        context.pop();
                      },
                    ),
              backgroundColor: AppColors.colors.whiteColors,
              elevation: 4,
              shadowColor: Colors.grey.shade300,
              title: Text(
                      "Make New Chat",
                      style: TextStyles.w500.copyWith(
                          fontSize: 16.sp, color: AppColors.colors.blackColors)),
              actions: [IconButton(
                        onPressed: () {
                          makeNewChatWatch.updateIsSearchFiledVisible();
                        },
                        icon: Icon(
                          Icons.search,
                          color: AppColors.colors.blackColors,
                        )), IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: AppColors.colors.blackColors,
                    )),
              ],
            ),
          );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}

/*
AppBar(
        leading: makeNewChatWatch.isSearchFiledVisible ?const SizedBox():IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded,color: AppColors.colors.greyRegent,),onPressed: (){
          context.pop();
        },),
        backgroundColor: AppColors.colors.whiteColors,
        elevation: 2.5,
        shadowColor: Colors.grey.shade300,
        title: makeNewChatWatch.isSearchFiledVisible?
            Row(
              children: [
                IconButton(onPressed: (){
                  makeNewChatWatch.updateIsSearchFiledVisible();
                }, icon: Icon(Icons.arrow_back,color: AppColors.colors.greyRegent,)),
                Expanded(child: CommonFormField(
                  contentPadding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 10.w),
                  fillColor: Colors.transparent,
                  border: const UnderlineInputBorder(),
                  hintText: "Search here",suffixIcon: IconButton(onPressed: (){},icon: const Icon(Icons.cancel_outlined),),))
              ],
            ):
        Text("Make New Chat",style: TextStyles.w500.copyWith(fontSize: 16.sp,color: AppColors.colors.blackColors),),
        actions: [
         makeNewChatWatch.isSearchFiledVisible? const SizedBox(): IconButton(onPressed: (){
            makeNewChatWatch.updateIsSearchFiledVisible();
          }, icon:  Icon(Icons.search,color: AppColors.colors.greyRegent,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.mic,color: AppColors.colors.greyRegent,)),
        ],
      )
 */
