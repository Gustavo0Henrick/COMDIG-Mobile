import 'package:flutter/material.dart';

abstract interface class IAppRoutesController {
  Route onGenerateRoute(RouteSettings routeSettings);
  PageRoute toInit();
  PageRoute toOnBoarding();
  PageRoute toLogin();
  PageRoute toRegister();
  PageRoute toRegisterData({required String email, required String password});
  PageRoute toForgotPassword();
  PageRoute toSendForgotPasswordCode();
  PageRoute toEnterCode({required String email});
  PageRoute toResetPassword({required String email, required String code});
  PageRoute toSuccessResetPassword();
  PageRoute toDashboard({required int page});
  PageRoute toMyProfile();
  PageRoute toEditProfile();
  PageRoute toSettings();
  PageRoute toEvent({required String url});
  PageRoute toCompany(
      {required String companyId,
      required String companyImage,
      required String companyName,
      required String companyCategory});
  PageRoute toReview({required String companyId});
  PageRoute toWelcome();
  PageRoute toTermsOfUse();
  PageRoute toAbout();
}
