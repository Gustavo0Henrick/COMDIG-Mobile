import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginFieldsComponent extends StatefulWidget {
  final Function onTap;
  final Function checkBoxFunction;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  bool value;
  LoginFieldsComponent({
    Key? key,
    required this.checkBoxFunction,
    required this.onTap,
    required this.value,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<LoginFieldsComponent> createState() => _LoginFieldsComponentState();
}

class _LoginFieldsComponentState extends State<LoginFieldsComponent> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizerHelper.calculateVertical(context, 500),
      width: SizerHelper.calculateHorizontal(context, 320),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: ResponsiveTextWidget(
                text: "Entre na sua conta",
                maxFontSize: 22,
                minFontSize: 18,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: SizerHelper.calculateVertical(context, 65),
                width: SizerHelper.calculateHorizontal(context, 320),
                child: TextFormField(
                  controller: widget.emailController,
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
              padding: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                height: SizerHelper.calculateVertical(context, 65),
                width: SizerHelper.calculateHorizontal(context, 320),
                child: TextFormField(
                  obscureText: obscureText,
                  controller: widget.passwordController,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () => setState(() => obscureText = !obscureText),
                        child: Icon(obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      filled: true,
                      hintText: "Senha"),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              width: SizerHelper.calculateHorizontal(context, 330),
              child: Row(
                children: [
                  SizedBox(
                    height: SizerHelper.calculateVertical(context, 30),
                    width: SizerHelper.calculateVertical(context, 30),
                    child: Checkbox(
                      onChanged: (_) => widget.checkBoxFunction(),
                      value: widget.value,
                    ),
                  ),
                  ResponsiveTextWidget(
                    text: "Lembrar usuário",
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.normal),
                    maxFontSize: 22,
                    minFontSize: 18,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                height: SizerHelper.calculateVertical(context, 150),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: SizerHelper.calculateVertical(context, 65),
                        width: SizerHelper.calculateHorizontal(context, 330),
                        child: FilledButton(
                          onPressed: () => widget.onTap(),
                          child: const ResponsiveTextWidget(text: "Entrar"),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: SizerHelper.calculateHorizontal(context, 160),
                        height: SizerHelper.calculateVertical(context, 50),
                        child: GestureDetector(
                          onTap: () => AppRoute().pushNamed(
                              context, AppRoutesKey.sendForgotPasswordCode),
                          child: ResponsiveTextWidget(
                            text: "Esqueceu a senha?",
                            maxFontSize: 22,
                            minFontSize: 18,
                            textStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
