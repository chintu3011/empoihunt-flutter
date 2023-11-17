import 'package:flutter/material.dart';

extension WidgetExtention on Widget {
  paddingAll(double val) => Padding(padding: EdgeInsets.all(val), child: this);

  paddingOnly(
      {double left = 0,
        double right = 0,
        double top = 0,
        double bottom = 0}) =>
      Padding(
          padding: EdgeInsets.only(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
          ),
          child: this);
  paddingHorizontal(double val) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: val), child: this);
  paddingVertical(double val) =>
      Padding(padding: EdgeInsets.symmetric(vertical: val), child: this);
  paddingSymmetric({double vertical = 0, double horizontal = 0}) => Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this);
  marginSymmetric({double vertical = 0, double horizontal = 0}) => Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this);

  marginHorizontal(double val) =>
      Container(margin: EdgeInsets.symmetric(horizontal: val), child: this);
  marginVertical(double val) =>
      Container(margin: EdgeInsets.symmetric(vertical: val), child: this);
  Widget marginOnly(
      {double left = 0,
        double right = 0,
        double top = 0,
        double bottom = 0}) =>
      Container(
          margin: EdgeInsets.only(
            left: left,
            right: right,
            top: top,
            bottom: bottom,
          ),
          child: this);

  marginAll(double val) => Container(margin: EdgeInsets.all(val), child: this);
}
