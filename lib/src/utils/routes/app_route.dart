import 'package:comdig/src/utils/routes/i_app_route.dart';
import 'package:flutter/material.dart';

class AppRoute implements IAppRoute {
  @override
  void goTo(BuildContext context, Route route,
      bool Function(Route<dynamic>) predicate,
      {List? args, data}) {
    Navigator.pushAndRemoveUntil(context, route, predicate);
  }

  @override
  void goToNamed(BuildContext context, String path,
      bool Function(Route<dynamic>) predicate,
      {List? args, data}) {
    Navigator.pushNamedAndRemoveUntil(context, path, predicate);
  }

  @override
  void pop(BuildContext context, {List? args, dynamic data}) {
    Navigator.pop(context, data);
  }

  @override
  void push(BuildContext context, Route route, {List? args, data}) {
    Navigator.push(context, route);
  }

  @override
  void pushNamed(BuildContext context, String path, {List? args, data}) {
    Navigator.pushNamed(context, path, arguments: data);
  }

  @override
  void pushNamedReplaced(BuildContext context, String path,
      {List? args, data}) {
    Navigator.pushReplacementNamed(context, path, arguments: data);
  }

  @override
  void pushReplacement(BuildContext context, Route route, {List? args, data}) {
    Navigator.pushReplacement(context, route);
  }
}
