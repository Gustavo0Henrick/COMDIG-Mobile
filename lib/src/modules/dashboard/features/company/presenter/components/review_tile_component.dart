import 'package:comdig/src/shared/helpers/image_decoder_helper.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class ReviewTileComponent extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String description;
  const ReviewTileComponent({
    Key? key,
    required this.image,
    required this.date,
    required this.description,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: SizedBox(
        height: SizerHelper.calculateVertical(context, 200),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageDecoderHelper.encodeBase64image(context, image,
                width: 80, height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: SizedBox(
                      width: SizerHelper.calculateHorizontal(context, 230),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                SizerHelper.calculateHorizontal(context, 130),
                            child: ResponsiveTextWidget(
                              text: name,
                              maxFontSize: 18,
                              minFontSize: 16,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 3),
                            child: ResponsiveTextWidget(
                              text: date,
                              maxFontSize: 16,
                              minFontSize: 14,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .inverseSurface,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 16,
                      bottom: 5,
                    ),
                    child: SizedBox(
                      width: SizerHelper.calculateHorizontal(context, 230),
                      child: ResponsiveTextWidget(
                        text: description,
                        maxFontSize: 18,
                        minFontSize: 16,
                        maxLines: 5,
                        textAlign: TextAlign.justify,
                        textStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
