import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class ResponsiveTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign textAlign;
  final double minFontSize;
  final double maxFontSize;
  final double textScaleFactor;
  final int maxLines;
  final String hintSemantics;
  final String? tooltipSemantics;
  final bool selectable;
  const ResponsiveTextWidget({
    Key? key,
    required this.text,
    this.textStyle,
    this.selectable = false,
    this.maxLines = 15,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.hintSemantics = "text",
    this.tooltipSemantics,
    this.textScaleFactor = 1,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      hint: hintSemantics,
      tooltip: tooltipSemantics,
      value: hintSemantics,
      label: hintSemantics,
      hidden: false,
      enabled: true,
      obscured: false,
      increasedValue: hintSemantics,
      tagForChildren: SemanticsTag(hintSemantics),
      child: selectable
          ? SelectableRegion(
              selectionControls: MaterialTextSelectionControls(),
              focusNode: FocusNode(),
              child: AutoSizeText(
                text,
                overflow: TextOverflow.ellipsis,
                style: textStyle,
                textAlign: textAlign,
                maxLines: maxLines,
                textScaleFactor: textScaleFactor,
                maxFontSize: maxFontSize,
                minFontSize: minFontSize,
                semanticsLabel: hintSemantics,
              ),
            )
          : AutoSizeText(
              text,
              overflow: TextOverflow.ellipsis,
              style: textStyle,
              textAlign: textAlign,
              maxLines: maxLines,
              textScaleFactor: textScaleFactor,
              maxFontSize: maxFontSize,
              minFontSize: minFontSize,
              semanticsLabel: hintSemantics,
            ),
    );
  }
}
