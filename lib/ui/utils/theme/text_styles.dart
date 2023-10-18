import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  static String fontFamilyPoppins = 'poppins';
  // static String fontFamilyMontserrat = 'Montserrat';

  static FontWeight fwThin = FontWeight.w100;
  static FontWeight fwExtraLight = FontWeight.w200;
  static FontWeight fwLight = FontWeight.w300;
  static FontWeight fwRegular = FontWeight.w400;
  static FontWeight fwMedium = FontWeight.w500;
  static FontWeight fwSemiBold = FontWeight.w600;
  static FontWeight fwBold = FontWeight.w700;
  static FontWeight fwExtraBold = FontWeight.w800;

  static TextStyle get w100 =>
      TextStyle(fontWeight: fwThin, fontFamily: fontFamilyPoppins);

  static TextStyle get w200 =>
      TextStyle(fontWeight: fwExtraLight, fontFamily: fontFamilyPoppins);

  static TextStyle get w300 =>
      TextStyle(fontWeight: fwLight, fontFamily: fontFamilyPoppins);

  static TextStyle get w400 =>
      TextStyle(fontWeight: fwRegular, fontFamily: fontFamilyPoppins);

  static TextStyle get w500 =>
      TextStyle(fontWeight: fwMedium, fontFamily: fontFamilyPoppins);

  static TextStyle get w600 =>
      TextStyle(fontWeight: fwSemiBold, fontFamily: fontFamilyPoppins);

  static TextStyle get w700 =>
      TextStyle(fontWeight: fwBold, fontFamily: fontFamilyPoppins);

  static TextStyle get w800 => TextStyle(
        fontWeight: fwExtraBold,
        fontFamily: fontFamilyPoppins,
      );
}
