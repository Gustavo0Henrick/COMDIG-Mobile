import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class CategoryItemComponent extends StatefulWidget {
  final String text;
  final Function onTap;
  final bool isSelected;
  const CategoryItemComponent(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  @override
  State<CategoryItemComponent> createState() => _CategoryItemComponentState();
}

class _CategoryItemComponentState extends State<CategoryItemComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => widget.onTap(),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(0.5)
                  : Theme.of(context)
                      .colorScheme
                      .inversePrimary
                      .withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          height: SizerHelper.calculateVertical(context, 50),
          width: SizerHelper.calculateHorizontal(context, 140),
          child: Center(
            child: ResponsiveTextWidget(
              text: widget.text,
              maxFontSize: 22,
              minFontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
