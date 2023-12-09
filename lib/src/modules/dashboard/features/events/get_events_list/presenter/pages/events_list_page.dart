import 'dart:developer';

import 'package:comdig/src/modules/dashboard/features/events/get_events_list/presenter/blocs/cubits/get_events_list_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_events_list/presenter/components/event_tile_component.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/themes/app_colors.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

class EventsListPage extends StatefulWidget {
  final GetEventsListCubit cubit;
  const EventsListPage({Key? key, required this.cubit}) : super(key: key);

  @override
  State<EventsListPage> createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  @override
  void initState() {
    _getEventsList();
    super.initState();
  }

  _getEventsList() {
    widget.cubit.getEventsList("Presidente Prudente");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
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
                  text: "Eventos",
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: size.width,
                    child: BlocBuilder<GetEventsListCubit, GetEventsListStates>(
                        bloc: widget.cubit,
                        builder: (context, state) {
                          if (state is GetEventsListLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is GetEventsListErrorState) {
                            log(state.failure.props.first.toString());
                          }
                          if (state is GetEventsListSuccessState &&
                              state.result.isNotEmpty) {
                            return RefreshIndicator(
                              onRefresh: () async => await _getEventsList(),
                              child: ListView.builder(
                                itemCount: state.result.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      EventTileComponent(
                                        onTap: () => AppRoute().pushNamed(
                                          context,
                                          AppRoutesKey.event,
                                          data: {
                                            "url": state.result[index].href
                                          },
                                        ),
                                        width: size.width,
                                        title: state.result[index].title,
                                        local: state.result[index].local,
                                        date: state.result[index].date,
                                      ),
                                      index == state.result.length - 1
                                          ? const SizedBox.shrink()
                                          : const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15),
                                              child: Divider(
                                                color: AppColors.gray,
                                                height: 2,
                                                thickness: 0.7,
                                              ),
                                            ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }
                          return SizedBox(
                            height: SizerHelper.calculateVertical(context, 100),
                            width:
                                SizerHelper.calculateHorizontal(context, 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const ResponsiveTextWidget(
                                  text: "Nenhum Evento Encontrado",
                                  maxFontSize: 26,
                                  minFontSize: 22,
                                ),
                                IconButton(
                                  onPressed: () async => await _getEventsList(),
                                  icon: const Icon(Icons.refresh),
                                ),
                              ],
                            ),
                          );
                        }),
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
