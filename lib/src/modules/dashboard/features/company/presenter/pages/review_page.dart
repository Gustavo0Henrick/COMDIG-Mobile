import 'dart:developer';

import 'package:comdig/src/modules/dashboard/features/company/domain/entities/post_review_entity.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/blocs/cubits/post_review_cubit.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/components/stars_component.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/shared/storages/storage_manager.dart';
import 'package:comdig/src/shared/widgets/error_popup_widget.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/shared/widgets/success_popup_widget.dart';
import 'package:comdig/src/themes/app_colors.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewPage extends StatefulWidget {
  final String companyId;
  const ReviewPage({Key? key, required this.companyId}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late PostReviewCubit cubit;

  int rating = 0;

  final _controller = TextEditingController();

  @override
  void initState() {
    cubit = BlocProvider.of<PostReviewCubit>(context);
    super.initState();
  }

  _postReviewListener(context, state) {
    if (state is PostReviewErrorState) {
      log(state.failure.toString());
      ErrorPopUpWidget.show(context, state.failure.props.first.toString());
    }

    if (state is PostReviewSuccessState) {
      SuccessPopUpWidget.show(
        context,
        "Avaliação enviada com sucesso!",
        () => AppRoute().pop(context),
      );
    }
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
          text: "Avaliação",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<PostReviewCubit, PostReviewStates>(
              bloc: cubit,
              listener: _postReviewListener,
              builder: (context, state) {
                if (state is PostReviewLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.8,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const ResponsiveTextWidget(
                                  text: "Sua Nota: ",
                                  maxFontSize: 32,
                                  minFontSize: 28,
                                  maxLines: 1,
                                ),
                                StarsComponent(rating: rating.toDouble()),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => setState(() => rating = 1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: rating == 1
                                            ? Theme.of(context)
                                                .colorScheme
                                                .outline
                                                .withOpacity(0.5)
                                            : AppColors.transparent),
                                    height: SizerHelper.calculateVertical(
                                        context, 80),
                                    width: SizerHelper.calculateVertical(
                                        context, 80),
                                    child: const Center(
                                        child: ResponsiveTextWidget(
                                      text: "1",
                                      maxFontSize: 32,
                                      minFontSize: 28,
                                      maxLines: 1,
                                    )),
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => setState(() => rating = 2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: rating == 2
                                            ? Theme.of(context)
                                                .colorScheme
                                                .outline
                                                .withOpacity(0.5)
                                            : AppColors.transparent),
                                    height: SizerHelper.calculateVertical(
                                        context, 80),
                                    width: SizerHelper.calculateVertical(
                                        context, 80),
                                    child: const Center(
                                        child: ResponsiveTextWidget(
                                      text: "2",
                                      maxFontSize: 32,
                                      minFontSize: 28,
                                      maxLines: 1,
                                    )),
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => setState(() => rating = 3),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: rating == 3
                                            ? Theme.of(context)
                                                .colorScheme
                                                .outline
                                                .withOpacity(0.5)
                                            : AppColors.transparent),
                                    height: SizerHelper.calculateVertical(
                                        context, 80),
                                    width: SizerHelper.calculateVertical(
                                        context, 80),
                                    child: const Center(
                                        child: ResponsiveTextWidget(
                                      text: "3",
                                      maxFontSize: 32,
                                      minFontSize: 28,
                                      maxLines: 1,
                                    )),
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => setState(() => rating = 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: rating == 4
                                            ? Theme.of(context)
                                                .colorScheme
                                                .outline
                                                .withOpacity(0.5)
                                            : AppColors.transparent),
                                    height: SizerHelper.calculateVertical(
                                        context, 80),
                                    width: SizerHelper.calculateVertical(
                                        context, 80),
                                    child: const Center(
                                        child: ResponsiveTextWidget(
                                      text: "4",
                                      maxFontSize: 32,
                                      minFontSize: 28,
                                      maxLines: 1,
                                    )),
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () => setState(() => rating = 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: rating == 5
                                            ? Theme.of(context)
                                                .colorScheme
                                                .outline
                                                .withOpacity(0.5)
                                            : AppColors.transparent),
                                    height: SizerHelper.calculateVertical(
                                        context, 80),
                                    width: SizerHelper.calculateVertical(
                                        context, 80),
                                    child: const Center(
                                        child: ResponsiveTextWidget(
                                      text: "5",
                                      maxFontSize: 32,
                                      minFontSize: 28,
                                      maxLines: 1,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                height:
                                    SizerHelper.calculateVertical(context, 150),
                                width: size.width,
                                child: TextFormField(
                                  controller: _controller,
                                  expands: true,
                                  maxLines: null,
                                  minLines: null,
                                  maxLength: 150,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  decoration: const InputDecoration(
                                    filled: true,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: SizedBox(
                                height:
                                    SizerHelper.calculateVertical(context, 65),
                                width: size.width,
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    side: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primaryContainer),
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  onPressed: () async {
                                    String image = await StorageManager()
                                            .readData(
                                                StorageKeys.profileImage) ??
                                        "";
                                    String userId = await SecureStorageManager()
                                            .readData(StorageKeys.userId) ??
                                        "";
                                    String name = await StorageManager()
                                            .readData(StorageKeys.name) ??
                                        "";
                                    String lastname =
                                        await StorageManager().readData(
                                                StorageKeys.lastname) ??
                                            "";
                                    PostReviewEntity postReviewEntity =
                                        PostReviewEntity(
                                      userId: userId,
                                      companyId: widget.companyId,
                                      rating: rating,
                                      image: image,
                                      name: "$name $lastname",
                                      description: _controller.text.trim(),
                                    );

                                    cubit.postReview(postReviewEntity);
                                  },
                                  child: const ResponsiveTextWidget(
                                      text: "Publicar"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
