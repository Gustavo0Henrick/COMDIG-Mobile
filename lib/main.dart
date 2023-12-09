import 'package:comdig/src/shared/service_locator/service_locator.dart';
import 'package:comdig/src/themes/app_themes_provider.dart';
import 'package:comdig/src/utils/comdig_app.dart';
import 'package:comdig/src/utils/enviroments/environment_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppThemeModeProvider().themeNotifier();
  setupLocator();
  await dotenv.load(fileName: ".env");
  environmentConfig = EnvironmentEnum.dev;
  return runApp(const ComDigApp());
}
