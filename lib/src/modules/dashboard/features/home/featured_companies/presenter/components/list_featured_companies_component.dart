import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/presenter/blocs/cubits/add_favorite_cubit.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/company_tile_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListFeaturedCompaniesComponent extends StatefulWidget {
  final List<CompanyItemEntity> listFeaturedCompanies;
  final Future<void> Function() refreshFunction;

  const ListFeaturedCompaniesComponent(
      {Key? key,
      required this.listFeaturedCompanies,
      required this.refreshFunction})
      : super(key: key);

  @override
  State<ListFeaturedCompaniesComponent> createState() =>
      _ListFeaturedCompaniesComponentState();
}

class _ListFeaturedCompaniesComponentState
    extends State<ListFeaturedCompaniesComponent> {
  late AddFavoriteCubit _addFavoriteCubit;

  @override
  void initState() {
    _addFavoriteCubit = BlocProvider.of<AddFavoriteCubit>(context);
    super.initState();
  }

  _addFavorite(String companyId) async =>
      await _addFavoriteCubit.addFavorite(companyId);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveTextWidget(
              text: "Destaques",
              maxFontSize: 18,
              minFontSize: 14,
              textStyle: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: widget.listFeaturedCompanies.isNotEmpty
                  ? size.height * 0.65
                  : SizerHelper.calculateVertical(context, 400),
              width: size.width,
              child: widget.listFeaturedCompanies.isNotEmpty
                  ? RefreshIndicator(
                      onRefresh: () => widget.refreshFunction(),
                      child: ListView.builder(
                        itemCount: widget.listFeaturedCompanies.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CompanyTileWidget(
                            onTapFavorite: (companyId) =>
                                _addFavorite(companyId),
                            width: size.width,
                            companyId: widget.listFeaturedCompanies[index].id,
                            title: widget.listFeaturedCompanies[index].name,
                            subtitle:
                                widget.listFeaturedCompanies[index].category,
                            companyImage:
                                widget.listFeaturedCompanies[index].image,
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      height: SizerHelper.calculateVertical(context, 120),
                      width: SizerHelper.calculateHorizontal(context, 250),
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
                            onPressed: widget.refreshFunction,
                            icon: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
