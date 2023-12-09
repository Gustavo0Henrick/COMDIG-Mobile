import 'package:comdig/src/modules/auth/forgotPassword/presenter/blocs/cubits/reset_password_cubit.dart';
import 'package:comdig/src/modules/auth/forgotPassword/presenter/blocs/cubits/send_forgot_password_code_cubit.dart';
import 'package:comdig/src/modules/auth/login/presenter/blocs/cubits/get_my_self_cubit.dart';
import 'package:comdig/src/modules/auth/login/presenter/blocs/cubits/login_user_cubit.dart';
import 'package:comdig/src/modules/auth/register/presenter/blocs/cubits/register_user_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/get_company_data_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/get_reviews_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/post_review_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/presenter/blocs/cubits/get_event_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/presenter/blocs/cubits/get_favorites_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/add_favorites/presenter/blocs/cubits/add_favorite_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/remove_favorites/presenter/blocs/cubits/remove_favorite_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/home/carousel/presenter/blocs/cubits/get_home_ads_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/home/featured_companies/presenter/blocs/cubits/get_featured_companies_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/home/nearby_companies/presenter/blocs/cubits/get_nearby_companies_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/presenter/blocs/cubits/get_events_list_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/presenter/blocs/cubits/edit_user_profile_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/presenter/blocs/cubits/get_my_profile_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/get_categories_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/get_companies_by_category_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/get_recommended_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/search_cubit.dart';
import 'package:comdig/src/shared/service_locator/service_locator.dart';
import 'package:comdig/src/themes/app_themes_provider.dart';
import 'package:comdig/src/themes/app_themes.dart';
import 'package:comdig/src/utils/routes/app_routes_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComDigApp extends StatefulWidget {
  const ComDigApp({super.key});

  @override
  State<ComDigApp> createState() => _ComDigAppState();
}

class _ComDigAppState extends State<ComDigApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    AppThemeModeProvider().addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    AppThemeModeProvider().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppThemeModeProvider.themeMode,
      builder: (_, __, ___) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoginUserCubit>(create: (_) => sl<LoginUserCubit>()),
            BlocProvider<RegisterUserCubit>(
                create: (_) => sl<RegisterUserCubit>()),
            BlocProvider<SendForgotPasswordCodeCubit>(
                create: (_) => sl<SendForgotPasswordCodeCubit>()),
            BlocProvider<ResetPasswordCubit>(
                create: (_) => sl<ResetPasswordCubit>()),
            BlocProvider<GetFavoritesCubit>(
                create: (_) => sl<GetFavoritesCubit>()),
            BlocProvider<GetMySelfCubit>(create: (_) => sl<GetMySelfCubit>()),
            BlocProvider<GetMyProfileCubit>(
                create: (_) => sl<GetMyProfileCubit>()),
            BlocProvider<EditUserProfileCubit>(
                create: (_) => sl<EditUserProfileCubit>()),
            BlocProvider<SearchCubit>(create: (_) => sl<SearchCubit>()),
            BlocProvider<GetCategoriesCubit>(
                create: (_) => sl<GetCategoriesCubit>()),
            BlocProvider<GetRecommendedCubit>(
                create: (_) => sl<GetRecommendedCubit>()),
            BlocProvider<GetFeaturedCompaniesCubit>(
                create: (_) => sl<GetFeaturedCompaniesCubit>()),
            BlocProvider<GetHomeAdsCubit>(create: (_) => sl<GetHomeAdsCubit>()),
            BlocProvider<GetNearbyCompaniesCubit>(
                create: (_) => sl<GetNearbyCompaniesCubit>()),
            BlocProvider<GetEventsListCubit>(
                create: (_) => sl<GetEventsListCubit>()),
            BlocProvider<GetEventCubit>(create: (_) => sl<GetEventCubit>()),
            BlocProvider<GetCompanyDataCubit>(
                create: (_) => sl<GetCompanyDataCubit>()),
            BlocProvider<GetReviewsCubit>(create: (_) => sl<GetReviewsCubit>()),
            BlocProvider<PostReviewCubit>(create: (_) => sl<PostReviewCubit>()),
            BlocProvider<AddFavoriteCubit>(
                create: (_) => sl<AddFavoriteCubit>()),
            BlocProvider<RemoveFavoriteCubit>(
                create: (_) => sl<RemoveFavoriteCubit>()),
            BlocProvider<GetCompaniesByCategoryCubit>(
                create: (_) => sl<GetCompaniesByCategoryCubit>()),
          ],
          child: MaterialApp(
            scrollBehavior: CustomScrollBehavior().copyWith(overscroll: false),
            title: 'COMDIG App',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.light(),
            darkTheme: AppThemes.dark(),
            themeMode: AppThemeModeProvider.themeMode.value,
            themeAnimationCurve: Curves.easeIn,
            themeAnimationDuration: const Duration(milliseconds: 400),
            onGenerateRoute: (routeSettings) =>
                AppRoutesController().onGenerateRoute(routeSettings),
          ),
        );
      },
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
