import 'package:comdig/src/modules/auth/forgotPassword/presenter/components/reset_password_fields_component.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  final String email;
  final String code;
  const ResetPasswordPage({
    Key? key,
    required this.code,
    required this.email,
  }) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
              Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: ResetPasswordFieldsComponent(email: widget.email),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
