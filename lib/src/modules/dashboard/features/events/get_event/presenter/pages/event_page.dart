import 'dart:developer';

import 'package:comdig/src/modules/dashboard/features/events/get_event/domain/entities/event_data_entity.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/presenter/blocs/cubits/get_event_cubit.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/error_popup_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class EventPage extends StatefulWidget {
  final String url;
  const EventPage({Key? key, required this.url}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late GetEventCubit _cubit;
  int links = 0;
  EventDataEntity _eventDataEntity = const EventDataEntity(
    title: "",
    local: "",
    organizador: "",
    initDate: "",
    endDate: "",
    address: "",
    facebookLink: "",
    instagramLink: "",
    twitterLink: "",
    webLink: "",
  );
  @override
  void initState() {
    _cubit = BlocProvider.of<GetEventCubit>(context);
    _cubit.getEvent(widget.url);
    _initLinks();
    super.initState();
  }

  _getEventListener(context, state) {
    if (state is GetEventErrorState) {
      log(state.failure.toString());
      ErrorPopUpWidget.show(context, state.failure.props.first.toString());
    }
    if (state is GetEventSuccessState) {
      _eventDataEntity = state.result;
    }
  }

  _openLink(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      log('Não foi possível abrir a URL: $url');
      ErrorPopUpWidget.show(context, 'Não foi possível abrir a URL: $url');
    }
  }

  _initLinks() {
    _eventDataEntity.instagramLink.isNotEmpty ? links++ : null;
    _eventDataEntity.twitterLink.isNotEmpty ? links++ : null;
    _eventDataEntity.facebookLink.isNotEmpty ? links++ : null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: SizerHelper.calculateVertical(context, 140),
        centerTitle: true,
        title: const ResponsiveTextWidget(
          text: "Evento",
          maxFontSize: 32,
          minFontSize: 28,
          maxLines: 1,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            size: 45,
          ),
          onPressed: () => AppRoute().pop(context),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: BlocConsumer<GetEventCubit, GetEventStates>(
            bloc: _cubit,
            listener: _getEventListener,
            builder: (context, state) {
              if (state is GetEventLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 40),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ResponsiveTextWidget(
                                text: _eventDataEntity.title,
                                maxFontSize: 30,
                                minFontSize: 26,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 3,
                              ),
                              ResponsiveTextWidget(
                                text: _eventDataEntity.local,
                                maxFontSize: 26,
                                minFontSize: 22,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.normal),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ResponsiveTextWidget(
                              text: "Endereço",
                              maxFontSize: 26,
                              minFontSize: 22,
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2,
                            ),
                            ResponsiveTextWidget(
                              text: _eventDataEntity.address,
                              maxFontSize: 22,
                              minFontSize: 18,
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.normal),
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        child: SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const ResponsiveTextWidget(
                                text: "Horário",
                                maxFontSize: 26,
                                minFontSize: 22,
                                textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                maxLines: 2,
                              ),
                              ResponsiveTextWidget(
                                text: "De: ${_eventDataEntity.initDate}",
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.normal),
                                maxLines: 2,
                              ),
                              ResponsiveTextWidget(
                                text: "Até: ${_eventDataEntity.endDate}",
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.normal),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: SizedBox(
                          height: SizerHelper.calculateVertical(context, 120),
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: links == 1
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.spaceEvenly,
                                children: [
                                  _eventDataEntity.facebookLink.isNotEmpty
                                      ? InkWell(
                                          onTap: () => _openLink(
                                              _eventDataEntity.facebookLink),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height:
                                                SizerHelper.calculateVertical(
                                                    context, 70),
                                            width:
                                                SizerHelper.calculateHorizontal(
                                                    context, 90),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline,
                                                width: 1,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(EvaIcons.facebook),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  _eventDataEntity.instagramLink.isNotEmpty
                                      ? InkWell(
                                          onTap: () => _openLink(
                                              _eventDataEntity.instagramLink),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height:
                                                SizerHelper.calculateVertical(
                                                    context, 70),
                                            width:
                                                SizerHelper.calculateHorizontal(
                                                    context, 90),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline,
                                                width: 1,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(Iconsax.instagram),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  _eventDataEntity.twitterLink.isNotEmpty
                                      ? InkWell(
                                          onTap: () => _openLink(
                                              _eventDataEntity.twitterLink),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height:
                                                SizerHelper.calculateVertical(
                                                    context, 70),
                                            width:
                                                SizerHelper.calculateHorizontal(
                                                    context, 90),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline,
                                                width: 1,
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(EvaIcons.twitter),
                                            ),
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ResponsiveTextWidget(
                              text: "Organizador",
                              textStyle: TextStyle(fontWeight: FontWeight.bold),
                              maxFontSize: 26,
                              minFontSize: 22,
                              maxLines: 2,
                            ),
                            ResponsiveTextWidget(
                              text: _eventDataEntity.organizador,
                              maxFontSize: 22,
                              minFontSize: 18,
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.normal),
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
