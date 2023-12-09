import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class DropwDownButtonWidget extends StatefulWidget {
  final Function(String?) function;
  final String hint;
  final String? initialValue;
  final List<String> items;
  final double width;
  final double height;
  const DropwDownButtonWidget({
    Key? key,
    required this.function,
    this.initialValue,
    required this.hint,
    required this.items,
    this.width = 330,
    this.height = 65,
  }) : super(key: key);

  @override
  State<DropwDownButtonWidget> createState() => _DropwDownButtonWidgetState();
}

class _DropwDownButtonWidgetState extends State<DropwDownButtonWidget> {
  String? value;

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizerHelper.calculateVertical(context, widget.height),
      width: SizerHelper.calculateHorizontal(context, widget.width),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).inputDecorationTheme.fillColor,
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: Container(),
        value: value,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ResponsiveTextWidget(
            text: widget.hint,
            textStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          ),
        ),
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ResponsiveTextWidget(
                text: value,
              ),
            ),
          );
        }).toList(),
        icon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Icon(Iconsax.arrow_down),
        ),
        onChanged: (newValue) => setState(
          () {
            widget.function(newValue);
            value = newValue;
          },
        ),
      ),
    );
  }
}
