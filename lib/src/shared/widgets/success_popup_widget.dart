import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

abstract class SuccessPopUpWidget {
  static show(context, message, function) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        Size size = MediaQuery.sizeOf(context);
        return StatefulBuilder(
          builder: (context, state) {
            return SizedBox(
              width: size.width * 0.5,
              height: size.height * 0.5,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      ErrorMessage(message: message),
                    ],
                  ),
                ),
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: SizedBox(
                      width: size.width,
                      height: SizerHelper.calculateVertical(context, 60),
                      child: FilledButton(
                        onPressed: () {
                          function();
                          Navigator.pop(context);
                        },
                        child: const Text("Fechar"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * 0.7,
      height: SizerHelper.calculateVertical(context, 240),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: SizerHelper.calculateVertical(context, 150),
            height: SizerHelper.calculateVertical(context, 150),
            child: Lottie.asset(
              "assets/images/success.json",
              fit: BoxFit.fill,
              repeat: false,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
            child: ResponsiveTextWidget(
              text: message,
              maxLines: 53,
              maxFontSize: 22,
              minFontSize: 18,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
