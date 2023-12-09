import 'package:comdig/src/modules/auth/forgotPassword/presenter/pages/enter_code_page.dart';
import 'package:comdig/src/modules/auth/forgotPassword/presenter/pages/reset_password_page.dart';
import 'package:comdig/src/modules/auth/forgotPassword/presenter/pages/send_forgot_password_code_page.dart';
import 'package:comdig/src/modules/auth/forgotPassword/presenter/pages/success_reset_password_page.dart';
import 'package:comdig/src/modules/auth/login/presenter/pages/login_page.dart';
import 'package:comdig/src/modules/auth/register/presenter/pages/register_data_page.dart';
import 'package:comdig/src/modules/auth/register/presenter/pages/register_page.dart';
import 'package:comdig/src/modules/dashboard/features/about/presenter/pages/about_page.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/pages/company_page.dart';
import 'package:comdig/src/modules/dashboard/features/company/presenter/pages/review_page.dart';
import 'package:comdig/src/modules/dashboard/features/events/get_event/presenter/pages/event_page.dart';
import 'package:comdig/src/modules/dashboard/features/profile/editProfile/presenter/pages/edit_profile_page.dart';
import 'package:comdig/src/modules/dashboard/features/profile/myProfile/presenter/pages/my_profile_page.dart';
import 'package:comdig/src/modules/dashboard/features/settings/presenter/pages/settings_page.dart';
import 'package:comdig/src/modules/dashboard/features/terms_of_use/presenter/pages/terms_of_use_page.dart';
import 'package:comdig/src/modules/dashboard/presenter/pages/dashboard_page.dart';
import 'package:comdig/src/modules/onboarding/presenter/onboarding_page.dart';
import 'package:comdig/src/modules/onboarding/welcome/presenter/pages/welcome_page.dart';
import 'package:comdig/src/utils/routes/app_routes_key.dart';
import 'package:comdig/src/utils/routes/i_app_routes_controller.dart';
import 'package:flutter/cupertino.dart';

class AppRoutesController implements IAppRoutesController {
  @override
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutesKey.init:
        return toInit();
      case AppRoutesKey.welcome:
        return toWelcome();
      case AppRoutesKey.onboarding:
        return toOnBoarding();
      case AppRoutesKey.login:
        return toLogin();
      case AppRoutesKey.register:
        return toRegister();
      case AppRoutesKey.registerData:
        Map<String, String> map =
            routeSettings.arguments as Map<String, String>;
        return toRegisterData(
          email: map["email"] as String,
          password: map["password"] as String,
        );
      case AppRoutesKey.forgotPassword:
        return toForgotPassword();
      case AppRoutesKey.sendForgotPasswordCode:
        return toSendForgotPasswordCode();
      case AppRoutesKey.enterCode:
        Map<String, String> map =
            routeSettings.arguments as Map<String, String>;
        return toEnterCode(email: map["email"] ?? "");

      case AppRoutesKey.resetPassword:
        Map<String, String> data =
            routeSettings.arguments as Map<String, String>;
        String email = data["email"] as String;
        String code = data["code"] as String;
        return toResetPassword(code: code, email: email);

      case AppRoutesKey.successResetPassword:
        return toSuccessResetPassword();
      case AppRoutesKey.dashboard:
        Map<String, int> data = routeSettings.arguments as Map<String, int>;
        int index = data["index"] as int;
        return toDashboard(page: index);
      case AppRoutesKey.editProfile:
        return toEditProfile();
      case AppRoutesKey.myProfile:
        return toMyProfile();
      case AppRoutesKey.settings:
        return toSettings();
      case AppRoutesKey.termsOfUse:
        return toTermsOfUse();
      case AppRoutesKey.about:
        return toAbout();
      case AppRoutesKey.event:
        Map<String, String> map =
            routeSettings.arguments as Map<String, String>;
        return toEvent(url: map["url"] ?? "");
      case AppRoutesKey.review:
        Map<String, String> map =
            routeSettings.arguments as Map<String, String>;
        return toReview(companyId: map["companyId"] ?? "");
      case AppRoutesKey.company:
        Map<String, String> map =
            routeSettings.arguments as Map<String, String>;
        return toCompany(
            companyId: map["companyId"] ?? "",
            companyImage: map["companyImage"] ?? "",
            companyName: map["companyName"] ?? "",
            companyCategory: map["companyCategory"] ?? "");
      default:
        return toInit();
    }
  }

  @override
  PageRoute toInit() {
    return CupertinoPageRoute(
      builder: (_) => const OnBoardingPage(),
    );
  }

  @override
  PageRoute toOnBoarding() {
    return CupertinoPageRoute(
      builder: (_) => const OnBoardingPage(),
    );
  }

  @override
  PageRoute toWelcome() {
    return CupertinoPageRoute(
      builder: (_) => const WelcomePage(),
    );
  }

  @override
  PageRoute toLogin() {
    return CupertinoPageRoute(
      builder: (_) => const LoginPage(),
    );
  }

  @override
  PageRoute toRegister() {
    return CupertinoPageRoute(
      builder: (_) => const RegisterPage(),
    );
  }

  @override
  PageRoute toRegisterData({required String email, required String password}) {
    return CupertinoPageRoute(
      builder: (_) => RegisterDataPage(email: email, password: password),
    );
  }

  @override
  PageRoute toForgotPassword() {
    return CupertinoPageRoute(
      builder: (_) => const RegisterPage(),
    );
  }

  @override
  PageRoute toSendForgotPasswordCode() {
    return CupertinoPageRoute(
      builder: (_) => const SendForgotPasswordCodePage(),
    );
  }

  @override
  PageRoute toEnterCode({required String email}) {
    return CupertinoPageRoute(
      builder: (_) => EnterCodePage(email: email),
    );
  }

  @override
  PageRoute toResetPassword({required String email, required String code}) {
    return CupertinoPageRoute(
      builder: (_) => ResetPasswordPage(code: code, email: email),
    );
  }

  @override
  PageRoute toSuccessResetPassword() {
    return CupertinoPageRoute(
      builder: (_) => const SuccessResetPasswordPage(),
    );
  }

  @override
  PageRoute toDashboard({required int page}) {
    return CupertinoPageRoute(
      builder: (_) => DashboardPage(index: page),
    );
  }

  @override
  PageRoute toMyProfile() {
    return CupertinoPageRoute(
      builder: (_) => const MyProfilePage(),
    );
  }

  @override
  PageRoute toEditProfile() {
    return CupertinoPageRoute(
      builder: (_) => const EditProfilePage(),
    );
  }

  @override
  PageRoute toSettings() {
    return CupertinoPageRoute(
      builder: (_) => const SettingsPage(),
    );
  }

  @override
  PageRoute toEvent({required String url}) {
    return CupertinoPageRoute(
      builder: (_) => EventPage(url: url),
    );
  }

  @override
  PageRoute toCompany(
      {required String companyId,
      required String companyImage,
      required String companyName,
      required String companyCategory}) {
    return CupertinoPageRoute(
      builder: (_) => CompanyPage(
          companyId: companyId,
          companyImage: companyImage,
          companyName: companyName,
          companyCategory: companyCategory),
    );
  }

  @override
  PageRoute toReview({required String companyId}) {
    return CupertinoPageRoute(
      builder: (_) => ReviewPage(companyId: companyId),
    );
  }

  @override
  PageRoute toTermsOfUse() {
    return CupertinoPageRoute(
      builder: (_) => const TermsOfUsePage(),
    );
  }

  @override
  PageRoute toAbout() {
    return CupertinoPageRoute(
      builder: (_) => const AboutPage(),
    );
  }
}
