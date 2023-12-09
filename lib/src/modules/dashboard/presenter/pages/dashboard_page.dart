import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/presenter/blocs/cubits/get_favorites_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/favorites/list_favorites/presenter/pages/list_favorites_page.dart';
import 'package:comdig/src/modules/dashboard/features/home/presenter/pages/home_page.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/presenter/blocs/cubits/get_events_list_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/presenter/pages/events_list_page.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/blocs/cubits/search_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/search/search_item/presenter/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class DashboardPage extends StatefulWidget {
  final int index;
  const DashboardPage({Key? key, required this.index}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int indexPage = 0;
  late PageController _pageController;

  late GetFavoritesCubit getFavoriteCubit;
  late SearchCubit searchCubit;
  late GetEventsListCubit getEventsListCubit;

  @override
  void initState() {
    indexPage = widget.index;
    searchCubit = BlocProvider.of<SearchCubit>(context);
    getFavoriteCubit = BlocProvider.of<GetFavoritesCubit>(context);
    getEventsListCubit = BlocProvider.of<GetEventsListCubit>(context);

    _pageController = PageController(initialPage: indexPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: PageView(
          controller: _pageController,
          pageSnapping: false,
          scrollDirection: Axis.horizontal,
          onPageChanged: (_) {},
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomePage(),
            SearchPage(cubit: searchCubit),
            EventsListPage(cubit: getEventsListCubit),
            ListFavoritesPage(cubit: getFavoriteCubit),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          currentIndex: indexPage,
          onTap: (page) => setState(
            () {
              indexPage = page;
              _pageController.animateToPage(
                page,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              );
            },
          ),
          items: const [
            BottomNavigationBarItem(
              label: "Inicial",
              icon: Icon(Iconsax.home_1),
              tooltip: "Vai para a página Inicial",
            ),
            BottomNavigationBarItem(
              label: "Procurar",
              icon: Icon(Iconsax.search_normal_1),
              tooltip: "Vai para a página de Procurar",
            ),
            BottomNavigationBarItem(
              label: "Eventos",
              icon: Icon(Iconsax.ticket),
              tooltip: "Vai para a página de Eventos",
            ),
            BottomNavigationBarItem(
              label: "Favoritos",
              icon: Icon(Iconsax.heart),
              tooltip: "Vai para a página de Favoritos",
            ),
          ],
        ),
      ),
    );
  }
}
