import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class LoginBottomLabelComponent extends StatelessWidget {
  const LoginBottomLabelComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizerHelper.calculateVertical(context, 320),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ResponsiveTextWidget(
            text: "Não possui uma conta?",
            textStyle: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.normal),
            maxFontSize: 22,
            minFontSize: 18,
          ),
          GestureDetector(
            onTap: () => AppRoute().pushNamed(context, AppRoutesKey.register),
            child: ResponsiveTextWidget(
              text: "Cadastrar",
              maxFontSize: 22,
              minFontSize: 18,
              textStyle: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
