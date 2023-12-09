import 'dart:developer';

import 'package:comdig/src/modules/dashboard/features/company/domain/entities/review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/domain/entities/reviews_info_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/get_reviews_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/components/review_tile_component.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/components/stars_component.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsComponent extends StatefulWidget {
  final String companyId;
  const ReviewsComponent({Key? key, required this.companyId}) : super(key: key);

  @override
  State<ReviewsComponent> createState() => _ReviewsComponentState();
}

class _ReviewsComponentState extends State<ReviewsComponent> {
  late GetReviewsCubit cubit;

  double rating = 0.0;
  int totalReviews = 0;

  List<ReviewEntity> reviews = [];

  @override
  void initState() {
    cubit = BlocProvider.of<GetReviewsCubit>(context);
    cubit.getReviews(widget.companyId);
    super.initState();
  }

  _getReviewsListener(context, state) {
    if (state is GetReviewsErrorState) {
      log(state.failure.toString());
    }

    if (state is GetReviewsSuccessState) {
      ReviewsInfoEntity success = state.result;
      setState(() {
        rating = success.rating;
        totalReviews = success.totalReviews;
        reviews = success.reviews;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () => AppRoute().pushNamed(context, AppRoutesKey.review,
            data: {"companyId": widget.companyId}),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: SizerHelper.calculateVertical(context, 75),
          height: SizerHelper.calculateVertical(context, 75),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primaryContainer),
          child: Center(
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.outlineVariant,
              size: 37,
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: BlocConsumer(
            bloc: cubit,
            listener: _getReviewsListener,
            builder: (context, state) {
              if (state is GetReviewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is GetReviewsSuccessState && reviews.isNotEmpty) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              StarsComponent(rating: rating),
                              ResponsiveTextWidget(
                                text: rating.toStringAsFixed(1),
                                maxFontSize: 30,
                                minFontSize: 28,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const ResponsiveTextWidget(
                                text: "Total de Avaliações: ",
                                maxFontSize: 24,
                                minFontSize: 20,
                              ),
                              ResponsiveTextWidget(
                                text: totalReviews.toString(),
                                maxFontSize: 28,
                                minFontSize: 24,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          color: Theme.of(context).colorScheme.outline,
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async =>
                              await cubit.getReviews(widget.companyId),
                          child: SizedBox(
                            width: size.width,
                            child: ListView.builder(
                              itemCount: reviews.length,
                              itemBuilder: (context, index) {
                                DateTime createdAt = reviews[index].createdAt;

                                String date =
                                    "${createdAt.day.toString().padLeft(2, "0")}/${createdAt.month.toString().padLeft(2, "0")}/${createdAt.year.toString().padLeft(4, "0")}";

                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ReviewTileComponent(
                                      date: date,
                                      description: reviews[index].description,
                                      image: reviews[index].image,
                                      name: reviews[index].name,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
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
                      text: "Nenhuma Avaliação Encontrada",
                      maxFontSize: 26,
                      minFontSize: 22,
                    ),
                    IconButton(
                      onPressed: () => cubit.getReviews(widget.companyId),
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
