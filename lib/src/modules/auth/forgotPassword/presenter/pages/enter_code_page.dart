import 'package:comdig/src/modules/auth/forgotPassword/presenter/components/enter_code_field_component.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class EnterCodePage extends StatefulWidget {
  final String email;
  const EnterCodePage({Key? key, required this.email}) : super(key: key);

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
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
              EnterCodeFieldComponent(email: widget.email),
            ],
          ),
        ),
      ),
    );
  }
}
