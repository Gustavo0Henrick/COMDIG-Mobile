import 'package:comdig/src/modules/dashboard/features/settings/presenter/components/profile_component.dart';
import 'package:comdig/src/modules/dashboard/features/settings/presenter/components/setting_button_component.dart';
import 'package:comdig/src/shared/helpers/auth_helper.dart';
import 'package:comdig/src/shared/helpers/size_helper.dart';
import 'package:comdig/src/shared/widgets/responsive_text_widget.dart';
import 'package:comdig/src/themes/app_themes_provider.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        title: const ResponsiveTextWidget(
          text: "Configurações",
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.shadow,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            ProfileComponent(
              width: size.width,
              height: SizerHelper.calculateVertical(context, 150),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SettingButtonComponent(
                width: size.width,
                label: "Modo do Tema",
                sufix: CupertinoSwitch(
                  thumbColor: Theme.of(context).colorScheme.onTertiary,
                  activeColor: Theme.of(context)
                      .colorScheme
                      .inverseSurface
                      .withOpacity(0.8),
                  value: AppThemeModeProvider().getThemeMode.value ==
                      ThemeMode.dark,
                  onChanged: (value) {
                    if (AppThemeModeProvider.themeMode.value ==
                        ThemeMode.dark) {
                      setState(() {
                        AppThemeModeProvider().setLightMode();
                      });
                    } else {
                      setState(() {
                        AppThemeModeProvider().setDarkMode();
                      });
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: SettingButtonComponent(
                width: size.width,
                label: "Editar Perfil",
                onTap: () => AppRoute()
                    .pushNamedReplaced(context, AppRoutesKey.editProfile),
              ),
            ),
            SettingButtonComponent(
              width: size.width,
              label: "Termos de Uso",
              onTap: () =>
                  AppRoute().pushNamed(context, AppRoutesKey.termsOfUse),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2, bottom: 2),
              child: SettingButtonComponent(
                width: size.width,
                label: "Sobre",
                       onTap: () =>
                  AppRoute().pushNamed(context, AppRoutesKey.about),
              ),
            ),
            Expanded(
              child: Container(
                width: size.width,
                color: Theme.of(context).colorScheme.onTertiary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                        width: size.width,
                        height: SizerHelper.calculateVertical(context, 70),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            foregroundColor:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: ResponsiveTextWidget(
                            text: "Sair",
                            textStyle: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async =>
                              await AuthHelper.logout(context),
                        ),
                      ),
                    ),
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
