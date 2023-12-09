import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';

class EventTileComponent extends StatelessWidget {
  final double? width;
  final String title;
  final String local;
  final String date;
  final VoidCallback onTap;
  const EventTileComponent({
    Key? key,
    this.width = 600,
    required this.title,
    required this.local,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => onTap(),
      child: SizedBox(
        height: SizerHelper.calculateVertical(context, 150),
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Align(
              child: SizedBox(
                width: width,
                height: SizerHelper.calculateVertical(context, 120),
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
                        text: local,
                        maxFontSize: 20,
                        minFontSize: 16,
                        maxLines: 1,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.normal,
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: ResponsiveTextWidget(
                        text: date,
                        maxFontSize: 20,
                        minFontSize: 16,
                        maxLines: 1,
                        textStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                              fontWeight: FontWeight.normal,
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
