import 'dart:developer';

import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/get_company_data_cubit.dart';
import 'package:comdig/src/shared/entities/company_item_entity.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyInfoComponent extends StatefulWidget {
  final String companyId;
  const CompanyInfoComponent({Key? key, required this.companyId})
      : super(key: key);

  @override
  State<CompanyInfoComponent> createState() => _CompanyInfoComponentState();
}

class _CompanyInfoComponentState extends State<CompanyInfoComponent> {
  late GetCompanyDataCubit cubit;

  String companyName = "";
  String category = "";
  String city = "";
  String uf = "";
  String address = "";
  String phone = "";
  String email = "";
  String site = "";
  String sunday = "";
  String monday = "";
  String tuesday = "";
  String wednesday = "";
  String thursday = "";
  String friday = "";
  String saturday = "";

  @override
  void initState() {
    cubit = BlocProvider.of<GetCompanyDataCubit>(context);
    cubit.getCompanyData(widget.companyId);
    super.initState();
  }

  _getCompanyDataListener(context, state) {
    if (state is GetCompanyDataErrorState) {
      log(state.failure.toString());
    }

    if (state is GetCompanyDataSuccessState) {
      CompanyItemEntity success = state.result;
      setState(() {
        companyName = success.name;
        category = success.category;
        city = success.city;
        uf = success.uf;
        phone = success.phone;
        email = success.email;
        address = success.address;
        site = success.site;
        sunday = success.sunday;
        monday = success.monday;
        tuesday = success.tuesday;
        wednesday = success.wednesday;
        thursday = success.thursday;
        friday = success.friday;
        saturday = success.saturday;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: BlocConsumer(
            bloc: cubit,
            listener: _getCompanyDataListener,
            builder: (context, state) {
              if (state is GetCompanyDataLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is GetCompanyDataSuccessState) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ResponsiveTextWidget(
                            text: "Endereço",
                            maxFontSize: 24,
                            minFontSize: 20,
                          ),
                          ResponsiveTextWidget(
                            text: address,
                            maxLines: 3,
                            maxFontSize: 22,
                            minFontSize: 18,
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ResponsiveTextWidget(
                            text: "Funcionamento",
                            maxFontSize: 24,
                            minFontSize: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ResponsiveTextWidget(
                                text: "Domingo",
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              ResponsiveTextWidget(
                                text: sunday,
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ResponsiveTextWidget(
                                text: "Segunda-feira",
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              ResponsiveTextWidget(
                                text: monday,
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ResponsiveTextWidget(
                                text: "Terça-feira",
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              ResponsiveTextWidget(
                                text: tuesday,
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ResponsiveTextWidget(
                                text: "Quarta-feira",
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              ResponsiveTextWidget(
                                text: wednesday,
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ResponsiveTextWidget(
                                text: "Quinta-feira",
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              ResponsiveTextWidget(
                                text: thursday,
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ResponsiveTextWidget(
                                text: "Sexta-feira",
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              ResponsiveTextWidget(
                                text: friday,
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ResponsiveTextWidget(
                                text: "Sábado",
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              ResponsiveTextWidget(
                                text: saturday,
                                maxFontSize: 22,
                                minFontSize: 18,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const ResponsiveTextWidget(
                            text: "Contato",
                            maxFontSize: 24,
                            minFontSize: 20,
                          ),
                          ResponsiveTextWidget(
                            text: phone,
                            maxLines: 1,
                            maxFontSize: 22,
                            minFontSize: 18,
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: ResponsiveTextWidget(
                              text: site,
                              maxLines: 2,
                              maxFontSize: 22,
                              minFontSize: 18,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
                      text: "Nenhuma Informação Encontrada",
                      maxFontSize: 26,
                      minFontSize: 22,
                    ),
                    IconButton(
                      onPressed: () => cubit.getCompanyData(widget.companyId),
                      icon: const Icon(Icons.refresh),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
