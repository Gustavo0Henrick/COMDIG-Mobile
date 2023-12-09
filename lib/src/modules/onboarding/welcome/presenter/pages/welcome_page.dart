import 'package:comdig/src/modules/onboarding/welcome/presenter/pages/welcome_one_page.dart';
import 'package:comdig/src/modules/onboarding/welcome/presenter/pages/welcome_three_page.dart';
import 'package:comdig/src/modules/onboarding/welcome/presenter/pages/welcome_two_page.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _controller = PageController(initialPage: 0);
  int page = 0;

  _changePage(int newPage) {
    _controller.animateToPage(newPage,
        duration: const Duration(milliseconds: 400), curve: Curves.decelerate);
    setState(() {
      page = newPage;
    });
  }

  _goToLogin() async {
    await SecureStorageManager().saveData(StorageKeys.onBoarding, "true");

    AppRoute().pushNamedReplaced(context, AppRoutesKey.login);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: PageView(
          controller: _controller,
          onPageChanged: (newPage) => setState(() => page = newPage),
          scrollDirection: Axis.horizontal,
          children: const [
            WelcomeOnePage(),
            WelcomeTwoPage(),
            WelcomeThreePage(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: size.width,
        height: SizerHelper.calculateVertical(context, 270),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: SizerHelper.calculateHorizontal(context, 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    height: SizerHelper.calculateVertical(context, 17),
                    width: SizerHelper.calculateVertical(context, 17),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.decelerate,
                    decoration: BoxDecoration(
                      color: page <= 0
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : Theme.of(context).colorScheme.surfaceTint,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  AnimatedContainer(
                    height: SizerHelper.calculateVertical(context, 17),
                    width: SizerHelper.calculateVertical(context, 17),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.decelerate,
                    decoration: BoxDecoration(
                      color: page == 1
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : Theme.of(context).colorScheme.surfaceTint,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  AnimatedContainer(
                    height: SizerHelper.calculateVertical(context, 17),
                    width: SizerHelper.calculateVertical(context, 17),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.decelerate,
                    decoration: BoxDecoration(
                      color: page >= 2
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : Theme.of(context).colorScheme.surfaceTint,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.decelerate,
                    opacity: page >= 1 ? 1 : 0,
                    child: SizedBox(
                      height: SizerHelper.calculateVertical(context, 60),
                      width: SizerHelper.calculateHorizontal(context, 150),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => page <= 0 ? null : _changePage(page - 1),
                        child: const Center(
                            child: ResponsiveTextWidget(
                          text: "Voltar",
                          maxFontSize: 24,
                          minFontSize: 20,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizerHelper.calculateVertical(context, 60),
                    width: SizerHelper.calculateHorizontal(context, 150),
                    child: FilledButton(
                      onPressed: () =>
                          page >= 2 ? _goToLogin() : _changePage(page + 1),
                      child: const ResponsiveTextWidget(text: "Próximo"),
                    ),
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
