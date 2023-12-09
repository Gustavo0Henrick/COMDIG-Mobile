import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/presenter/blocs/cubits/add_favorite_cubit.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/company_tile_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListRecommendedComponent extends StatefulWidget {
  final List<CompanyItemEntity> listRecommended;
  final Future<void> Function() refreshFunction;

  const ListRecommendedComponent(
      {Key? key, required this.listRecommended, required this.refreshFunction})
      : super(key: key);

  @override
  State<ListRecommendedComponent> createState() =>
      _ListRecommendedComponentState();
}

class _ListRecommendedComponentState extends State<ListRecommendedComponent> {
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
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ResponsiveTextWidget(
                text: "Recomendado",
                maxFontSize: 18,
                minFontSize: 14,
                textStyle: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: SizedBox(
                  width: size.width,
                  child: widget.listRecommended.isNotEmpty
                      ? ListView.builder(
                          itemCount: widget.listRecommended.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CompanyTileWidget(
                              onTapFavorite: (companyId) =>
                                  _addFavorite(companyId),
                              width: size.width,
                              companyId: widget.listRecommended[index].id,
                              title: widget.listRecommended[index].name,
                              subtitle: widget.listRecommended[index].category,
                              companyImage: widget.listRecommended[index].image,
                            );
                          },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
