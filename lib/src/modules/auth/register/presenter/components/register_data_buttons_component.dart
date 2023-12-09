import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:flutter/material.dart';

class RegisterDataButtonsComponent extends StatelessWidget {
  final Function()? onTap;
  const RegisterDataButtonsComponent({Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizerHelper.calculateVertical(context, 160),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              height: SizerHelper.calculateVertical(context, 65),
              width: SizerHelper.calculateHorizontal(context, 340),
              child: FilledButton(
                onPressed: onTap,
                child: const ResponsiveTextWidget(text: "Cadastrar"),
              ),
            ),
          ),
          SizedBox(
            height: SizerHelper.calculateVertical(context, 65),
            width: SizerHelper.calculateHorizontal(context, 340),
            child: OutlinedButton(
              onPressed: () => AppRoute().pop(context),
              child: const ResponsiveTextWidget(text: "Voltar"),
            ),
          ),
        ],
      ),
    );
  }
}
