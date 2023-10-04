import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static String fontFamilyInter = 'Inter';
  static String fontFamilyMontserrat = 'Montserrat';

  static FontWeight fwThin = FontWeight.w100;
  static FontWeight fwExtraLight = FontWeight.w200;
  static FontWeight fwLight = FontWeight.w300;
  static FontWeight fwRegular = FontWeight.w400;
  static FontWeight fwMedium = FontWeight.w500;
  static FontWeight fwSemiBold = FontWeight.w600;
  static FontWeight fwBold = FontWeight.w700;
  static FontWeight fwExtraBold = FontWeight.w800;

  static TextStyle get w100 =>
      TextStyle(fontWeight: fwThin, fontFamily: fontFamilyInter);

  static TextStyle get w200 =>
      TextStyle(fontWeight: fwExtraLight, fontFamily: fontFamilyInter);

  static TextStyle get w300 =>
      TextStyle(fontWeight: fwLight, fontFamily: fontFamilyInter);

  static TextStyle get w400 =>
      TextStyle(fontWeight: fwRegular, fontFamily: fontFamilyInter);

  static TextStyle get w500 =>
      TextStyle(fontWeight: fwMedium, fontFamily: fontFamilyInter);

  static TextStyle get w600 =>
      TextStyle(fontWeight: fwSemiBold, fontFamily: fontFamilyInter);

  static TextStyle get w700 =>
      TextStyle(fontWeight: fwBold, fontFamily: fontFamilyInter);

  static TextStyle get w800 => TextStyle(
        fontWeight: fwExtraBold,
        fontFamily: fontFamilyInter,
      );
}
