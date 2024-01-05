import 'package:cached_network_image/cached_network_image.dart';
import 'package:emploiflutter/ui/utils/extension/context_extension.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';

import '../theme/theme.dart';


class CommonImageViewer extends StatelessWidget {
  final String imageUrl;
  const CommonImageViewer({required this.imageUrl,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colors.blackColors,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                width: double.infinity,
                child: Hero(
                  tag: "profileHero",
                  child: InteractiveViewer(
                      child: CachedNetworkImage(imageUrl: imageUrl,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),fit: BoxFit.fill,)
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 6,
              child: IconButton(onPressed: (){
                context.pop();
              }, icon: Icon(Icons.close,size: 30,color: AppColors.colors.blueColors,),style: ElevatedButton.styleFrom(backgroundColor: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
