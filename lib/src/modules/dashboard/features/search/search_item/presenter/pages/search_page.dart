import 'dart:developer';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/get_categories_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/get_companies_by_category_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/get_recommended_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/search_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/components/category_item_component.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/components/list_recommended_component.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/components/search_result_component.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class SearchPage extends StatefulWidget {
  final SearchCubit cubit;
  const SearchPage({Key? key, required this.cubit}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();

  String? categorySearch;
  int? categorySelected;

  late GetCategoriesCubit getCategoriesCubit;
  late GetRecommendedCubit getRecommendedCubit;
  late GetCompaniesByCategoryCubit getCompaniesByCategoryCubit;

  bool _showCategoriesComponent = false;

  @override
  void initState() {
    getCategoriesCubit = BlocProvider.of<GetCategoriesCubit>(context);
    getRecommendedCubit = BlocProvider.of<GetRecommendedCubit>(context);
    getCompaniesByCategoryCubit =
        BlocProvider.of<GetCompaniesByCategoryCubit>(context);
    _getRecomendedAndCategories();
    categorySelected = null;
    categorySearch = null;
    super.initState();
  }

  _getRecomendedAndCategories() {
    getCategoriesCubit.getCategories();
    return getRecommendedCubit.getRecommended();
  }

  _getCategoriesListener(context, state) {
    if (state is GetCategoriesSuccessState) {
      setState(() => _showCategoriesComponent = !_showCategoriesComponent);
    }
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
                  text: "Procurar",
                  maxFontSize: 28,
                  minFontSize: 24,
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40),
                child: SizedBox(
                  height: SizerHelper.calculateVertical(context, 55),
                  child: SearchBar(
                    controller: searchController,
                    hintText: "Insira o texto...",
                    onChanged: (value) {},
                    onSubmitted: (value) => widget.cubit.search(value),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: BlocBuilder<SearchCubit, SearchStates>(
                  bloc: widget.cubit,
                  builder: (context, state) {
                    if (state is SearchLoadingState) {
                      return const SizedBox.shrink();
                    }
                    if (state is SearchErrorState) {
                      log(state.failure.props.first.toString());
                    }
                    if (state is SearchSuccessState) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ResponsiveTextWidget(
                            text: "Resultado da Busca",
                            maxFontSize: 18,
                            minFontSize: 14,
                            textStyle: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              searchController.clear();
                              widget.cubit.cleanSearch();
                              _getRecomendedAndCategories();
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.close,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                ResponsiveTextWidget(
                                  text: "Limpar",
                                  maxFontSize: 18,
                                  minFontSize: 14,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate,
                      width: size.width,
                      height: SizerHelper.calculateVertical(
                          context, _showCategoriesComponent ? 105 : 0),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 1600),
                        curve: Curves.ease,
                        opacity: _showCategoriesComponent ? 1 : 0,
                        child: BlocConsumer<GetCategoriesCubit,
                                GetCategoriesStates>(
                            bloc: getCategoriesCubit,
                            listener: _getCategoriesListener,
                            builder: (context, state) {
                              if (state is GetCategoriesErrorState) {
                                log(state.failure.props.first.toString());
                                ResponsiveTextWidget(
                                  text: "Erro ao Carregar as Categorias",
                                  maxFontSize: 18,
                                  minFontSize: 14,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                );
                              }
                              if (state is GetCategoriesSuccessState &&
                                  state.result.isNotEmpty) {
                                return SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ResponsiveTextWidget(
                                        text: "Categorias",
                                        maxFontSize: 18,
                                        minFontSize: 14,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: SizerHelper.calculateVertical(
                                            context, 80),
                                        width: size.width,
                                        child: ListView.builder(
                                          itemCount: state.result.length,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 5,
                                                vertical: 10,
                                              ),
                                              child: CategoryItemComponent(
                                                  isSelected:
                                                      categorySelected == index,
                                                  onTap: () {
                                                    if (categorySelected !=
                                                        index) {
                                                      categorySelected = index;
                                                    } else {
                                                      categorySelected = null;
                                                    }
                                                    setState(() {});
                                                    if (categorySearch !=
                                                        state.result[index]
                                                            .categoryName) {
                                                      setState(() =>
                                                          categorySearch = state
                                                              .result[index]
                                                              .categoryName);
                                                      getCompaniesByCategoryCubit
                                                          .getCompaniesByCategory(
                                                              categorySearch!);
                                                    } else {
                                                      categorySearch = null;
                                                      getCompaniesByCategoryCubit
                                                          .cleanState();
                                                    }
                                                  },
                                                  text: state.result[index]
                                                      .categoryName),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            }),
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<GetCompaniesByCategoryCubit,
                      GetCompaniesByCategoryStates>(
                  bloc: getCompaniesByCategoryCubit,
                  builder: (context, state) {
                    if (state is GetCompaniesByCategoryLoadingState) {
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is GetCompaniesByCategoryErrorState) {
                      log(state.failure.props.first.toString());
                    }
                    if (state is GetCompaniesByCategorySuccessState &&
                        categorySelected != null) {
                      return SearchResultComponent(
                        searchResults: state.result,
                        refreshFunction: () => getCompaniesByCategoryCubit
                            .getCompaniesByCategory(categorySearch!),
                      );
                    }
                    return BlocBuilder<SearchCubit, SearchStates>(
                        bloc: widget.cubit,
                        builder: (context, state) {
                          if (state is SearchLoadingState) {
                            return const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (state is SearchErrorState) {
                            log(state.failure.props.first.toString());
                          }
                          if (state is SearchSuccessState) {
                            return SearchResultComponent(
                              searchResults: state.result,
                              refreshFunction: () =>
                                  widget.cubit.search(searchController.text),
                            );
                          }
                          return BlocBuilder<GetRecommendedCubit,
                              GetRecommendedStates>(builder: (context, state) {
                            if (state is GetRecommendedLoadingState) {
                              return const Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            if (state is GetRecommendedSuccessState) {
                              return ListRecommendedComponent(
                                listRecommended: state.result,
                                refreshFunction: () =>
                                    _getRecomendedAndCategories(),
                              );
                            }
                            return const SizedBox.shrink();
                          });
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
