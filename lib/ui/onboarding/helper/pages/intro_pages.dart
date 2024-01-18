
import '../../../utils/theme/theme.dart';

class IntroPageView extends StatelessWidget {
  final IntroPageModel model;

  const IntroPageView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SizedBox(
              child: Image.asset(model.img,)),
        ),
        Text(textAlign: TextAlign.center,model.title,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20.sp,color: Colors.black),),
        SizedBox(height: 8.h,),
        Text(textAlign: TextAlign.center,model.subtile,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14.sp,color: Colors.grey)),
        SizedBox(height: 50.h,),
      ],
    );
  }
}









typedef IntroPageModel = ({String img, String title, String subtile});