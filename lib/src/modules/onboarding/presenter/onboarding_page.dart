import 'package:comdig/src/shared/storages/secure_storage_manager.dart';
import 'package:comdig/src/shared/storages/storage_keys.dart';
import 'package:comdig/src/utils/routes/app_route.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  _goHome() async {
    var result = await SecureStorageManager().readData(StorageKeys.onBoarding);
    if (result != null && result == "true") {
      AppRoute().pushNamedReplaced(context, AppRoutesKey.login);
      
    } else {
      AppRoute().pushNamedReplaced(context, AppRoutesKey.welcome);
    }
  }

  @override
  void initState() {
    _goHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
