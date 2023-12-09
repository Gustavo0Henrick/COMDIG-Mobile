import 'dart:developer';

import 'package:comdig/src/modules/dashboard/features/home/carousel/presenter/blocs/cubits/get_home_ads_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/presenter/blocs/cubits/get_featured_companies_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/presenter/components/list_featured_companies_component.dart';
import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/presenter/blocs/cubits/get_nearby_companies_cubit.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GetFeaturedCompaniesCubit getFeaturedCompaniesCubit;
  late GetHomeAdsCubit getHomeAdsCubit;
  late GetNearbyCompaniesCubit getNearbyCompaniesCubit;

  bool _showHomeAdsComponent = false;
  bool _showNearbyCompaniesComponent = false;

  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.75,
  );

  @override
  void initState() {
    getFeaturedCompaniesCubit =
        BlocProvider.of<GetFeaturedCompaniesCubit>(context);
    getHomeAdsCubit = BlocProvider.of<GetHomeAdsCubit>(context);
    getNearbyCompaniesCubit = BlocProvider.of<GetNearbyCompaniesCubit>(context);
    getFeaturedCompaniesCubit.getFeaturedCompanies();
    getHomeAdsCubit.getHomeAds();
    Future.wait([
      SecureStorageManager().readData(StorageKeys.userId),
    ]).then(
      (userId) {
        String id = userId.first as String;
        getNearbyCompaniesCubit.getNearbyCompanies(id);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _getHomeAdsListener(context, state) {
    if (state is GetHomeAdsLoadingState) {}
    if (state is GetHomeAdsErrorState) {
      log(state.failure.toString());
    }
    if (state is GetHomeAdsSuccessState) {
      setState(() => _showHomeAdsComponent = !_showHomeAdsComponent);
    }
  }

  _getNearbyCompaniesListener(context, state) {
    if (state is GetNearbyCompaniesLoadingState) {}
    if (state is GetNearbyCompaniesErrorState) {
      log(state.failure.toString());
    }
    if (state is GetNearbyCompaniesSuccessState) {
      setState(
          () => _showNearbyCompaniesComponent = !_showNearbyCompaniesComponent);
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
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ResponsiveTextWidget(
                  text: "Inicial",
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 300),
            //   curve: Curves.decelerate,
            //   width: size.width,
            //   height: SizerHelper.calculateVertical(
            //       context, _showHomeAdsComponent ? 180 : 0),
            //   child: AnimatedOpacity(
            //     duration: const Duration(milliseconds: 1600),
            //     curve: Curves.ease,
            //     opacity: _showHomeAdsComponent ? 1 : 0,
            //     child: BlocConsumer<GetHomeAdsCubit, GetHomeAdsStates>(
            //       listener: _getHomeAdsListener,
            //       bloc: getHomeAdsCubit,
            //       builder: (context, state) {
            //         if (state is GetHomeAdsSuccessState) {
            //           return SizedBox(
            //             child: CardsCarouselComponent(
            //                 pageController: _pageController),
            //           );
            //         }
            //         return const SizedBox.shrink();
            //       },
            //     ),
            //   ),
            // ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: BlocBuilder<GetFeaturedCompaniesCubit,
                        GetFeaturedCompaniesStates>(builder: (context, state) {
                      if (state is GetFeaturedCompaniesLoadingState) {
                        return SizedBox(
                          height: size.height * 0.7,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (state is GetFeaturedCompaniesErrorState) {
                        log(state.failure.toString());
                      }
                      if (state is GetFeaturedCompaniesSuccessState) {
                        return ListFeaturedCompaniesComponent(
                          listFeaturedCompanies: state.result,
                          refreshFunction: () =>
                              getFeaturedCompaniesCubit.getFeaturedCompanies(),
                        );
                      }
                      return const SizedBox.shrink();
                    }),
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
