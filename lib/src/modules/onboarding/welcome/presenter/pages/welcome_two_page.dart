import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeTwoPage extends StatelessWidget {
  const WelcomeTwoPage({Key? key}) : super(key: key);

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
              child: Lottie.asset("assets/images/party.json"),
            ),
           const ResponsiveTextWidget(
              text: "Encontre os eventos mais incríveis próximos a você.",
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
