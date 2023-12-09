import 'package:comdig/src/modules/dashboard/features/company/presenter/components/company_info_component.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/components/reviews_component.dart';
import 'package:comdig/src/shared/helpers/image_decoder_helper.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  final String companyId;
  final String companyName;
  final String companyCategory;
  final String companyImage;
  const CompanyPage({
    Key? key,
    required this.companyId,
    required this.companyName,
    required this.companyCategory,
    required this.companyImage,
  }) : super(key: key);

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: SizerHelper.calculateVertical(context, 140),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: [
                  ImageDecoderHelper.encodeBase64image(context, widget.companyImage,
                      width: 125, height: 125),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Align(
                      child: SizedBox(
                        height: SizerHelper.calculateVertical(context, 100),
                        width: SizerHelper.calculateHorizontal(context, 180),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ResponsiveTextWidget(
                              text: widget.companyName,
                              maxFontSize: 28,
                              minFontSize: 24,
                              maxLines: 2,
                              textStyle: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ResponsiveTextWidget(
                                text: widget.companyCategory,
                                maxFontSize: 24,
                                minFontSize: 20,
                                maxLines: 1,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.normal,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width,
              height: 60,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Theme.of(context).colorScheme.outline,
                labelStyle: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 20),
                labelColor: Theme.of(context).textTheme.labelMedium!.color,
                onTap: (page) =>
                    setState(() => _pageController.jumpToPage(page)),
                tabs: const [
                  Tab(
                    height: 50,
                    text: "Informações",
                  ),
                  Tab(
                    height: 50,
                    text: "Avaliações",
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: size.width,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CompanyInfoComponent(companyId: widget.companyId),
                    ReviewsComponent(companyId: widget.companyId),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
