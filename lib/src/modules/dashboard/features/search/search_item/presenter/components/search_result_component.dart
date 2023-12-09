import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/presenter/blocs/cubits/add_favorite_cubit.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/widgets/company_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultComponent extends StatefulWidget {
  final List<CompanyItemEntity> searchResults;
  final Function refreshFunction;
  const SearchResultComponent(
      {Key? key, required this.searchResults, required this.refreshFunction})
      : super(key: key);

  @override
  State<SearchResultComponent> createState() => _SearchResultComponentState();
}

class _SearchResultComponentState extends State<SearchResultComponent> {
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
        padding: const EdgeInsets.only(top: 30),
        child: SizedBox(
          width: size.width,
          child: RefreshIndicator(
            onRefresh: () => widget.refreshFunction(),
            child: ListView.builder(
              itemCount: widget.searchResults.length,
              itemBuilder: (context, index) {
                return CompanyTileWidget(
                  onTapFavorite: (companyId) => _addFavorite(companyId),
                  width: size.width,
                  companyId: widget.searchResults[index].id,
                  title: widget.searchResults[index].name,
                  subtitle: widget.searchResults[index].category,
                  companyImage: widget.searchResults[index].image,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
