import 'package:emploiflutter/ui/home/helper/recruiter/helper/recruiter_appbar.dart';
import 'package:emploiflutter/ui/home/helper/recruiter/helper/recruiter_list_tile.dart';
import 'package:emploiflutter/ui/messenger_modul/messenger/messanger.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:flutter/services.dart';

class RecruiterHome extends ConsumerStatefulWidget {
  const RecruiterHome({super.key});

  @override
  ConsumerState<RecruiterHome> createState() => _RecruiterHomeState();
}

class _RecruiterHomeState extends ConsumerState<RecruiterHome> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.colors.clayColors,
    ));
    // final homeWatch = ref.watch(homeController);
    return Scaffold(
      appBar: const RecruiterAppbar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: 8.h, left: 10.w, right: 10.w),
              child: Column(
                  children:
                  List.generate(10, (index) {
                    return const RecruiterListTile();
                  })
              ) ,
            ),
          ),
          // value == 0 ? const JobSeekerListTile():const RecruiterListTile(),
          Positioned(
              right: 0,
              top: 35.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const Messenger()));
                },
                child: Container(
                  height: 80.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    color: AppColors.colors.clayColors,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r)),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}


