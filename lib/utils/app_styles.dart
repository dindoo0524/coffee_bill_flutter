import 'package:flutter/material.dart';

Color primary = const Color(0xFF49281A);
Color secondary = const Color(0XFFDFB78C);
Color point = const Color(0XFFAB6832);
Color grey = const Color(0XFFF4F4F5);

class Styles {
  static Color primaryColor = primary;
  static Color secondaryColor = secondary;
  static Color pointColor = point;
  static Color greyColor = grey;

  static Color textColor = const Color(0XFF3B3B3B);
  static Color whiteColor = const Color(0XFFFFFFFF);

  static TextStyle textStyle =
      TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.w500);

  static TextStyle textWhiteStyle =
      TextStyle(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w500);

  static TextStyle buttonTextStyle =
      TextStyle(fontSize: 16, color: whiteColor, fontWeight: FontWeight.w700);

  static TextStyle headLineStyle1 =
      TextStyle(fontSize: 26, color: primaryColor, fontWeight: FontWeight.bold);

  static TextStyle headLineStyle2 =
      TextStyle(fontSize: 21, color: primaryColor, fontWeight: FontWeight.bold);

  static TextStyle headLineStyle3 =
      TextStyle(fontSize: 17, color: textColor, fontWeight: FontWeight.w500);

  static TextStyle headLineStyle4 =
      TextStyle(fontSize: 14, color: textColor, fontWeight: FontWeight.w500);
}
