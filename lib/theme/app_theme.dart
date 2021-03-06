import 'package:flutter/material.dart';

///
final base = ThemeData.light();

///
ThemeData appTheme() {
  TextTheme _appTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1!.copyWith(
          fontSize: 40,
          color: Colors.white,
          fontFamily: 'SourseSansPro',
          fontWeight: FontWeight.w600),
      headline2: base.headline2!.copyWith(
          fontSize: 20,
          color: const Color(0XFF4A4A4A),
          fontFamily: 'SourseSansPro',
          fontWeight: FontWeight.w600),
      subtitle1: base.subtitle1!.copyWith(
          fontSize: 21,
          color: const Color(0XFF0E73CC),
          fontFamily: 'SourseSansPro',
          fontWeight: FontWeight.w600),
      subtitle2: base.subtitle2!.copyWith(
          fontSize: 21,
          color: Colors.white,
          fontFamily: 'SourseSansPro',
          fontWeight: FontWeight.w400),
      bodyText1: base.bodyText1!.copyWith(
          fontSize: 21,
          color: Colors.white,
          fontFamily: 'SourseSansPro',
          fontWeight: FontWeight.w400),
      button: base.button!.copyWith(
          fontSize: 28,
          color: Colors.white,
          fontFamily: 'SourseSansPro',
          fontWeight: FontWeight.w400),
    );
  }

  return base.copyWith(
    primaryColor: const Color(0XFF73D0FA),
    secondaryHeaderColor: Colors.white,
    textTheme: _appTextTheme(base.textTheme),
    unselectedWidgetColor: const Color(0XFFD9D9D9),
    toggleableActiveColor: Colors.white,
    scaffoldBackgroundColor: const Color(0XFFF2F2F7),
    backgroundColor: const Color(0XFFF2F2F7),
    shadowColor: Colors.black12,
    cardColor: const Color(0XFFFFFFFF),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      elevation: 0,
    ),
  );
}
