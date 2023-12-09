import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeThreePage extends StatelessWidget {
  const WelcomeThreePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: SizerHelper.calculateVertical(context, 300),
              height: SizerHelper.calculateVertical(context, 300),
              child: Lottie.asset("assets/images/review.json"),
            ),
          const  ResponsiveTextWidget(
              text:
                  "Explore as avaliações dos usuários e tome decisões informadas sobre onde ir na sua região.",
              maxFontSize: 24,
              minFontSize: 20,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
