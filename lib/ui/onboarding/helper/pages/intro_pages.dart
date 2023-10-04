
import '../../../utils/theme/theme.dart';

class IntroPageView extends StatelessWidget {
  final IntroPageModel model;

  const IntroPageView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        SizedBox(
            child: Image.asset(model.img,)),
        SizedBox(height: 30.h),
        Text(textAlign: TextAlign.center,model.title,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18.sp,color: Colors.black),),
        SizedBox(height: 10.h,),
        Text(textAlign: TextAlign.center,model.subtile,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14.sp,color: Colors.grey)),
        SizedBox(height: 80.h,),
      ],
    );
  }
}









typedef IntroPageModel = ({String img, String title, String subtile});