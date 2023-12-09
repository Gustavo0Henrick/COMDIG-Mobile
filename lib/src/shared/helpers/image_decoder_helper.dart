import 'dart:convert';

import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:flutter/material.dart';

abstract class ImageDecoderHelper {
  static Widget encodeBase64image(BuildContext context, String base64image,
      {double width = 90, double height = 90}) {
    final byteImage = const Base64Decoder().convert(base64image);

    Widget result = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: base64image == null
            ? Border.all(
                color: Theme.of(context).colorScheme.inversePrimary,
                width: 2,
              )
            : null,
      ),
      height: SizerHelper.calculateVertical(context, height),
      width: SizerHelper.calculateVertical(context, width),
      child: Center(
        child: base64image != null
            ? Image.memory(
                byteImage,
                fit: BoxFit.fill,
                height: SizerHelper.calculateVertical(context, height - 10),
                width: SizerHelper.calculateVertical(context, width - 10),
              )
            : Icon(
                Icons.image,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
      ),
    );
    return result;
  }
}
