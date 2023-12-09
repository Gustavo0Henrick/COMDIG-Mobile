import 'package:comdig/src/shared/helpers/image_decoder_helper.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MyImageComponent extends StatelessWidget {
  final double heigth;
  final double width;
  final String? imageBase64;
  const MyImageComponent(
      {Key? key,
      required this.heigth,
      required this.width,
      required this.imageBase64})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: heigth,
        color: Theme.of(context).colorScheme.onTertiary,
        child: Center(
          child: Container(
            height: SizerHelper.calculateVertical(context, 180),
            width: SizerHelper.calculateVertical(context, 180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.gray,
            ),
            child: imageBase64 != null
                ? ImageDecoderHelper.encodeBase64image(
                    context,
                    imageBase64!,
                    width: 180,
                    height: 180,
                  )
                : null,
          ),
        ));
  }
}
