import 'dart:developer';

import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/presenter/blocs/cubits/get_favorites_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/presenter/blocs/cubits/remove_favorite_cubit.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/shared/widgets/company_tile_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class ListFavoritesPage extends StatefulWidget {
  final GetFavoritesCubit cubit;
  const ListFavoritesPage({Key? key, required this.cubit}) : super(key: key);

  @override
  State<ListFavoritesPage> createState() => _ListFavoritesPageState();
}

class _ListFavoritesPageState extends State<ListFavoritesPage> {
  TextEditingController searchController = TextEditingController();
  String userId = "";

  late RemoveFavoriteCubit _removeFavoriteCubit;

  @override
  void initState() {
    Future.wait(
      [
        SecureStorageManager().readData(StorageKeys.userId),
      ],
    ).then((id) => userId = id.first as String);
    _removeFavoriteCubit = BlocProvider.of<RemoveFavoriteCubit>(context);
    widget.cubit.getFavorites(userId);

    super.initState();
  }

  _removeFavorite(String companyId) async {
    await _removeFavoriteCubit.removeFavorite(companyId);
    await widget.cubit.getFavorites(userId);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: SizerHelper.calculateVertical(context, 140),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconButton(
              onPressed: () =>
                  AppRoute().pushNamed(context, AppRoutesKey.settings),
              icon: Icon(
                Iconsax.setting_2,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ResponsiveTextWidget(
                  text: "Favoritos",
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: SizerHelper.calculateVertical(context, 55),
                  child: SearchBar(
                    controller: searchController,
                    hintText: "Insira o texto...",
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: size.width,
                  child: BlocBuilder<GetFavoritesCubit, GetFavoritesStates>(
                      bloc: widget.cubit,
                      builder: (context, state) {
                        if (state is GetFavoritesLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is GetFavoritesErrorState) {
                          log(state.failure.props.first.toString());
                        }
                        if (state is GetFavoritesSuccessState &&
                            state.result.isNotEmpty) {
                          return RefreshIndicator(
                            onRefresh: () => widget.cubit.getFavorites(userId),
                            child: ListView.builder(
                              itemCount: state.result.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CompanyTileWidget(
                                  isFavorited: true,
                                  onTapFavorite: (String companyId) =>
                                      _removeFavorite(companyId),
                                  width: size.width,
                                  companyImage: state.result[index].image,
                                  companyId: state.result[index].id,
                                  title: state.result[index].name,
                                  subtitle: state.result[index].category,
                                );
                              },
                            ),
                          );
                        }
                        return SizedBox(
                          height: SizerHelper.calculateVertical(context, 100),
                          width: SizerHelper.calculateHorizontal(context, 150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const ResponsiveTextWidget(
                                text: "Sem Favoritos",
                                maxFontSize: 26,
                                minFontSize: 22,
                              ),
                              IconButton(
                                onPressed: () =>
                                    widget.cubit.getFavorites(userId),
                                icon: const Icon(Icons.refresh),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
