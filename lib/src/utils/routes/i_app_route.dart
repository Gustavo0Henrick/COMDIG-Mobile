import 'package:flutter/material.dart';

abstract interface class IAppRoute {
  void push(BuildContext context, Route route,
      {List<dynamic>? args, dynamic data});
  void pushReplacement(BuildContext context, Route route,
      {List<dynamic>? args, dynamic data});
  void pushNamed(BuildContext context, String path,
      {List<dynamic>? args, dynamic data});
  void pushNamedReplaced(BuildContext context, String path,
      {List<dynamic>? args, dynamic data});

  void pop(BuildContext context,
      {List<dynamic>? args, dynamic data});

  void goTo(BuildContext context, Route route,
      bool Function(Route<dynamic>) predicate,
      {List<dynamic>? args, dynamic data});
  void goToNamed(BuildContext context, String path,
      bool Function(Route<dynamic>) predicate,
      {List<dynamic>? args, dynamic data});
}
