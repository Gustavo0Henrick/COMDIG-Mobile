import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCardComponent extends StatelessWidget {
  final bool isCurrentCard;
  const HomeCardComponent({Key? key, required this.isCurrentCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
      width: SizerHelper.calculateHorizontal(context, 300),
      height: SizerHelper.calculateVertical(context, isCurrentCard ? 180 : 120),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.darkGray,
      ),
    );
  }
}
