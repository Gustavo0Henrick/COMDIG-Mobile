import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class RegisterFieldsComponent extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  const RegisterFieldsComponent({
    Key? key,
    required this.confirmPasswordController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<RegisterFieldsComponent> createState() =>
      _RegisterFieldsComponentState();
}

class _RegisterFieldsComponentState extends State<RegisterFieldsComponent> {
  bool passwordValue = true;
  bool confirmPasswordValue = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: ResponsiveTextWidget(
            text: "Cadastrar",
            maxFontSize: 22,
            minFontSize: 18,
            textStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: SizerHelper.calculateVertical(context, 65),
            width: SizerHelper.calculateHorizontal(context, 330),
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
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: SizerHelper.calculateVertical(context, 65),
            width: SizerHelper.calculateHorizontal(context, 330),
            child: TextFormField(
              obscureText: passwordValue,
              controller: widget.passwordController,
              decoration: InputDecoration(
                filled: true,
                hintText: "Senha",
                suffixIcon: IconButton(
                  onPressed: () =>
                      setState(() => passwordValue = !passwordValue),
                  icon: Icon(
                      passwordValue ? Icons.visibility_off : Icons.visibility),
                ),
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
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
            width: SizerHelper.calculateHorizontal(context, 330),
            child: TextFormField(
              obscureText: confirmPasswordValue,
              controller: widget.confirmPasswordController,
              decoration: InputDecoration(
                filled: true,
                hintText: "Confirme a Senha",
                suffixIcon: IconButton(
                  onPressed: () => setState(
                      () => confirmPasswordValue = !confirmPasswordValue),
                  icon: Icon(confirmPasswordValue
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
              validator: (text) {
                if (text == null ||
                    text.isEmpty ||
                    text != widget.passwordController.text) {
                  return '';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
