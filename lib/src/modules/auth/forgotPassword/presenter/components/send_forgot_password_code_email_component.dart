import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class SendForgotPasswordCodeEmailComponent extends StatefulWidget {
  const SendForgotPasswordCodeEmailComponent({Key? key}) : super(key: key);

  @override
  State<SendForgotPasswordCodeEmailComponent> createState() =>
      _SendForgotPasswordCodeEmailComponentState();
}

class _SendForgotPasswordCodeEmailComponentState
    extends State<SendForgotPasswordCodeEmailComponent> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizerHelper.calculateHorizontal(context, 330),
      height: SizerHelper.calculateVertical(context, 460),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ResponsiveTextWidget(
                text: "Esqueceu a senha?",
                maxFontSize: 24,
                minFontSize: 20,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ResponsiveTextWidget(
              text:
                  // "Please fill email and we'll send you a code to get back into your account.",
                  "Por favor, insira o seu email e nós enviaremos a você um código para recuperar sua conta.",
              maxFontSize: 22,
              minFontSize: 18,
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.normal),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: SizedBox(
                height: SizerHelper.calculateVertical(context, 65),
                width: SizerHelper.calculateHorizontal(context, 330),
                child: TextFormField(
                  controller: emailController,
                  decoration:
                      const InputDecoration(filled: true, hintText: "Email"),
                  validator: (text) {
                    if (text == null ||
                        text.isEmpty ||
                        !text.contains("@") ||
                        !text.contains(".")) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SizedBox(
                height: SizerHelper.calculateVertical(context, 65),
                width: SizerHelper.calculateHorizontal(context, 330),
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AppRoute().pushNamed(
                        context,
                        AppRoutesKey.enterCode,
                        data: {"email": emailController.text},
                      );
                    }
                  },
                  child: const ResponsiveTextWidget(text: "Enviar"),
                ),
              ),
            ),
            SizedBox(
              height: SizerHelper.calculateVertical(context, 65),
              width: SizerHelper.calculateHorizontal(context, 330),
              child: OutlinedButton(
                onPressed: () => AppRoute().pop(context),
                child: const ResponsiveTextWidget(text: "Cancelar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
