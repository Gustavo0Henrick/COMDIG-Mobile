import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class ResetPasswordFieldsComponent extends StatefulWidget {
  final String email;
  const ResetPasswordFieldsComponent({Key? key, required this.email})
      : super(key: key);

  @override
  State<ResetPasswordFieldsComponent> createState() =>
      _ResetPasswordFieldsComponentState();
}

class _ResetPasswordFieldsComponentState
    extends State<ResetPasswordFieldsComponent> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizerHelper.calculateHorizontal(context, 340),
      height: SizerHelper.calculateVertical(context, 500),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: ResponsiveTextWidget(
                text: "Nova Senha",
                maxFontSize: 24,
                minFontSize: 20,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ResponsiveTextWidget(
              text: "Por favor insira a nova senha para sua conta.",
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
                width: SizerHelper.calculateHorizontal(context, 340),
                child: TextFormField(
                  obscureText: obscureText,
                  controller: passwordController,
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
                    if (text == null || text.isEmpty || text.length < 8) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: SizerHelper.calculateVertical(context, 65),
              width: SizerHelper.calculateHorizontal(context, 340),
              child: TextFormField(
                obscureText: obscureText,
                controller: confirmationController,
                decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() => obscureText = !obscureText),
                      child: Icon(obscureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                    filled: true,
                    hintText: "Confirme a Senha"),
                validator: (text) {
                  if (text != passwordController.text ||
                      text == null ||
                      text.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20),
              child: SizedBox(
                height: SizerHelper.calculateVertical(context, 65),
                width: SizerHelper.calculateHorizontal(context, 340),
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AppRoute().pushNamed(
                          context, AppRoutesKey.successResetPassword);
                    }
                  },
                  child: const ResponsiveTextWidget(text: "Enviar"),
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
      ),
    );
  }
}
