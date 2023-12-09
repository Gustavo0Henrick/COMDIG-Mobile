import 'package:auto_size_text/auto_size_text.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class EnterCodeFieldComponent extends StatefulWidget {
  final String email;
  const EnterCodeFieldComponent({Key? key, required this.email})
      : super(key: key);

  @override
  State<EnterCodeFieldComponent> createState() =>
      _EnterCodeFieldComponentState();
}

class _EnterCodeFieldComponentState extends State<EnterCodeFieldComponent> {
  TextEditingController codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: SizedBox(
        width: SizerHelper.calculateHorizontal(context, 330),
        height: SizerHelper.calculateVertical(context, 550),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: ResponsiveTextWidget(
                  text: "Código de Confirmação",
                  maxFontSize: 24,
                  minFontSize: 20,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AutoSizeText.rich(
                textScaleFactor: 1,
                maxFontSize: 20,
                minFontSize: 18,
                TextSpan(
                  text: "Insira o código de confirmação que enviamos para ",
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: widget.email,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: SizedBox(
                  height: SizerHelper.calculateVertical(context, 65),
                  width: SizerHelper.calculateHorizontal(context, 330),
                  child: TextFormField(
                    controller: codeController,
                    decoration: const InputDecoration(
                        filled: true, hintText: "Código de Confirmação"),
                    validator: (text) {
                      if (text == null || text.isEmpty || text.length < 5) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ResponsiveTextWidget(
                      text: "Não recebeu o código? ",
                      maxFontSize: 22,
                      minFontSize: 18,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ResponsiveTextWidget(
                        text: "Reenviar",
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: SizerHelper.calculateVertical(context, 160),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          height: SizerHelper.calculateVertical(context, 65),
                          width: SizerHelper.calculateHorizontal(context, 330),
                          child: FilledButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                AppRoute().pushNamed(
                                  context,
                                  AppRoutesKey.resetPassword,
                                  data: {
                                    "code": codeController.text,
                                    "email": widget.email,
                                  },
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
                          onPressed: () => AppRoute().pop(
                            context,
                            data: {"email": widget.email},
                          ),
                          child: const ResponsiveTextWidget(text: "Voltar"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
