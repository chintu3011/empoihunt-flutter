import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';


class CommonSearchAppBar extends StatelessWidget {
  final List<Widget> action;
  final  void Function()? searchSuffixClick;
  final  void Function()? onBackArrowTap;
  const CommonSearchAppBar({super.key, required this.action,required this.searchSuffixClick,required this.onBackArrowTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        decoration:  BoxDecoration(
            color: AppColors.colors.whiteColors,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0.0, 6.0),
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 8,
                spreadRadius: 0.0,
              )
            ]
        ),
        child:  Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  IconButton(onPressed: onBackArrowTap, icon: Icon(Icons.arrow_back,color: AppColors.colors.greyRegent,)),
                  Expanded(child: CommonFormField(
                    contentPadding: EdgeInsets.symmetric(vertical: 0.h,horizontal: 10.w),
                    fillColor: Colors.transparent,
                    border: const UnderlineInputBorder(),
                    hintText: "Search here",suffixIcon: IconButton(onPressed: searchSuffixClick,icon: const Icon(Icons.cancel_outlined),),))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: action,
            )
          ],
        ),
      ),
    );
  }

  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.h);
}
