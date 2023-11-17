import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ///---------------------Navigation--------------------------///
  void push(Widget widget) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => widget));

  void pop() => Navigator.pop(this);

  void pushNamed(String route,{dynamic arg}) => Navigator.pushNamed(this, route,arguments: arg);

  void pushAndRemoveUntilNamed(String route) =>
      Navigator.pushNamedAndRemoveUntil(this, route, (route) => false);

  void pushAndReplaceNamed(String route) =>
      Navigator.pushReplacementNamed(this, route);

  void popAndPushNamed(String route) => Navigator.popAndPushNamed(this, route);

  ///-------------------------------------------------////
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;
}
