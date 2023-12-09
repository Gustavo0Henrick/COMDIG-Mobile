import 'package:auto_size_text/auto_size_text.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class RegisterTermsLabelComponent extends StatelessWidget {
  const RegisterTermsLabelComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 40),
        child: GestureDetector(
          onTap: () => AppRoute().pushNamed(context, AppRoutesKey.termsOfUse),
          child: AutoSizeText.rich(
            TextSpan(
                text: "Ao cadastrar, você concorda com nossos ",
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                    text: "Termos",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                  ),
                  TextSpan(
                    text: ", ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: "Políticas de dados ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                  ),
                  TextSpan(
                    text: "e ",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: "Políticas de Cookies ",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
