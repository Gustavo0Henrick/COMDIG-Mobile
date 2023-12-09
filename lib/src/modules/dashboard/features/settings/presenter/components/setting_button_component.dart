import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class SettingButtonComponent extends StatefulWidget {
  final double width;
  final String label;
  final Widget? sufix;
  final Function? onTap;
  const SettingButtonComponent({
    Key? key,
    required this.width,
    this.label = "Button",
    this.sufix,
    this.onTap,
  }) : super(key: key);

  @override
  State<SettingButtonComponent> createState() => _SettingButtonComponentState();
}

class _SettingButtonComponentState extends State<SettingButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap != null ? () => widget.onTap!() : null,
      child: Container(
        width: widget.width,
        height: SizerHelper.calculateVertical(context, 65),
        color: Theme.of(context).colorScheme.onTertiary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveTextWidget(
                text: widget.label,
                maxFontSize: 24,
                minFontSize: 20,
                textStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
              widget.sufix ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
