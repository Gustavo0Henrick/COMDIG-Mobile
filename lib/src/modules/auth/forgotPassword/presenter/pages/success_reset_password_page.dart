import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class SuccessResetPasswordPage extends StatefulWidget {
  const SuccessResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<SuccessResetPasswordPage> createState() =>
      _SuccessResetPasswordPageState();
}

class _SuccessResetPasswordPageState extends State<SuccessResetPasswordPage> {
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
                padding: const EdgeInsets.only(bottom: 150),
                child: SizedBox(
                  width: SizerHelper.calculateHorizontal(context, 330),
                  height: SizerHelper.calculateVertical(context, 450),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: ResponsiveTextWidget(
                          text: "Success",
                          maxFontSize: 24,
                          minFontSize: 20,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ResponsiveTextWidget(
                        text:
                            "Your password has been successfully reset. Please login and log into your account.",
                        maxFontSize: 22,
                        minFontSize: 18,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.normal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          height: SizerHelper.calculateVertical(context, 65),
                          width: SizerHelper.calculateHorizontal(context, 330),
                          child: OutlinedButton(
                            onPressed: () => AppRoute()
                                .pushNamedReplaced(context, AppRoutesKey.login),
                            child: const ResponsiveTextWidget(text: "Close"),
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
      ),
    );
  }
}
