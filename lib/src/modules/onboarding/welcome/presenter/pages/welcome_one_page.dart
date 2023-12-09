import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeOnePage extends StatelessWidget {
  const WelcomeOnePage({Key? key}) : super(key: key);

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
              child: Lottie.asset("assets/images/company.json"),
            ),
            const ResponsiveTextWidget(
              text:
                  "Descubra empresas locais e serviços essenciais ao seu redor. Vamos começar a explorar juntos!",
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
