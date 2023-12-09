import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class MyProfileLabelComponent extends StatefulWidget {
  final double width;
  final String label;
  final String? value;
  const MyProfileLabelComponent({
    Key? key,
    required this.width,
    this.label = "Label",
    this.value,
  }) : super(key: key);

  @override
  State<MyProfileLabelComponent> createState() =>
      _MyProfileLabelComponentState();
}

class _MyProfileLabelComponentState extends State<MyProfileLabelComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: SizerHelper.calculateVertical(context, 65),
      color: Theme.of(context).colorScheme.onTertiary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: widget.width * 0.3,
              child: ResponsiveTextWidget(
                text: widget.label,
                maxFontSize: 22,
                minFontSize: 18,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
            ResponsiveTextWidget(
              text: widget.value ?? "",
              maxFontSize: 22,
              minFontSize: 18,
              textStyle: TextStyle(
                fontWeight: FontWeight.normal,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
