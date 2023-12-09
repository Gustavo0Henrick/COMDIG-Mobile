import 'package:comdig/src/shared/helpers/image_decoder_helper.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CompanyTileWidget extends StatelessWidget {
  final double width;
  final String title;
  final String subtitle;
  final String companyId;
  final String companyImage;
  final bool isFavorited;
  final Function(String) onTapFavorite;
  const CompanyTileWidget(
      {Key? key,
      required this.width,
      required this.companyId,
      required this.subtitle,
      required this.companyImage,
      required this.onTapFavorite,
      this.isFavorited = false,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRoute().pushNamed(context, AppRoutesKey.company, data: {
        "companyId": companyId,
        "companyName": title,
        "companyCategory": subtitle,
        "companyImage": companyImage,
      }),
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: SizerHelper.calculateVertical(context, 120),
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ImageDecoderHelper.encodeBase64image(context, companyImage),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: SizerHelper.calculateVertical(context, 70),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:
                                SizerHelper.calculateHorizontal(context, 170),
                            child: ResponsiveTextWidget(
                              text: title,
                              maxFontSize: 22,
                              minFontSize: 18,
                              maxLines: 1,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          ResponsiveTextWidget(
                            text: subtitle,
                            maxFontSize: 18,
                            minFontSize: 14,
                            maxLines: 1,
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: PopupMenuButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.more_horiz_rounded,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () => onTapFavorite(companyId),
                      child: SizedBox(
                        width: width * 0.3,
                        height: 40,
                        child: isFavorited
                            ? const Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Icon(Icons.remove),
                                  ),
                                  ResponsiveTextWidget(
                                    text: "Remover",
                                    maxFontSize: 18,
                                    minFontSize: 16,
                                  ),
                                ],
                              )
                            : const Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Icon(Icons.add),
                                  ),
                                  ResponsiveTextWidget(
                                    text: "Favorito",
                                    maxFontSize: 18,
                                    minFontSize: 16,
                                  ),
                                ],
                              ),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => AppRoute()
                          .pushNamed(context, AppRoutesKey.company, data: {
                        "companyId": companyId,
                        "companyName": title,
                        "companyCategory": subtitle,
                        "companyImage": companyImage,
                      }),
                      child: SizedBox(
                        width: width * 0.3,
                        height: 40,
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Icon(Iconsax.info_circle),
                            ),
                            ResponsiveTextWidget(
                              text: "Info",
                              maxFontSize: 18,
                              minFontSize: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
