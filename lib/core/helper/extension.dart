import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  Future<dynamic> push(String routName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      String routName, bool Function(Route<dynamic>) predicate,
      {Object? arguments}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
