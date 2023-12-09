import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ListNearbyCompaniesComponent extends StatelessWidget {
  final List<CompanyItemEntity> listNearbyCompanies;
  final Future<void> Function() refreshFunction;

  const ListNearbyCompaniesComponent(
      {Key? key,
      required this.listNearbyCompanies,
      required this.refreshFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveTextWidget(
                text: "Proxímo a você",
                maxFontSize: 18,
                minFontSize: 14,
                textStyle: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: SizerHelper.calculateVertical(context, 300),
                width: size.width,
                child: listNearbyCompanies.isNotEmpty
                    ? ListView.builder(
                        itemCount: listNearbyCompanies.length,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              color: AppColors.gray,
                              height:
                                  SizerHelper.calculateVertical(context, 300),
                              width:
                                  SizerHelper.calculateHorizontal(context, 200),
                            ),
                          );
                        },
                      )
                    : SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ResponsiveTextWidget(
                              text: "Nenhuma Empresa Encontrada",
                              textAlign: TextAlign.center,
                              maxFontSize: 26,
                              minFontSize: 22,
                            ),
                            IconButton(
                              onPressed: refreshFunction,
                              icon: const Icon(Icons.refresh),
                            ),
                          ],
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
