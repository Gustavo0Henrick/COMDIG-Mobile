import 'package:comdig/src/modules/auth/forgotPassword/presenter/components/send_forgot_password_code_email_component.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';

import 'package:flutter/material.dart';

class SendForgotPasswordCodePage extends StatefulWidget {
  const SendForgotPasswordCodePage({Key? key}) : super(key: key);

  @override
  State<SendForgotPasswordCodePage> createState() =>
      _SendForgotPasswordCodePageState();
}

class _SendForgotPasswordCodePageState
    extends State<SendForgotPasswordCodePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 70),
                  child: ResponsiveTextWidget(
                    text: "COMDIG",
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 150),
                child: SendForgotPasswordCodeEmailComponent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
