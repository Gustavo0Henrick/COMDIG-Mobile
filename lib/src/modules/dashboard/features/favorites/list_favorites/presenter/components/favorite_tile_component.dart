import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class FavoriteTileComponent extends StatelessWidget {
  final double? width;
  final String title;
  final String subtitle;
  const FavoriteTileComponent({
    Key? key,
    this.width = 600,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: SizedBox(
        height: SizerHelper.calculateVertical(context, 100),
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        width: 2,
                      ),
                    ),
                    height: SizerHelper.calculateVertical(context, 75),
                    width: SizerHelper.calculateVertical(context, 75),
                    child: Center(
                      child: Icon(
                        Icons.image,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Align(
                      child: SizedBox(
                        height: SizerHelper.calculateVertical(context, 85),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ResponsiveTextWidget(
                              text: title,
                              maxFontSize: 24,
                              minFontSize: 20,
                              maxLines: 2,
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ResponsiveTextWidget(
                                text: subtitle,
                                maxFontSize: 20,
                                minFontSize: 16,
                                maxLines: 1,
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
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
