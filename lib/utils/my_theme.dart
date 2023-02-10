// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyThemeData {
  static Color lightPrimary = Color(0xff5D9CEC);

  static Color colorLightGreen = Color(0xffDFECDB);
  static Color colorBlack = Color(0xff242424);
  static Color colorRed = Color(0xffEC4B4B);
  static Color colorGreen = Color(0xff61E757);
  static Color colorWhite = Color(0xFFFFFFFF);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    colorScheme: ColorScheme(
      primary: lightPrimary,
      onPrimary: colorWhite,
      secondary: Colors.grey,
      onSecondary: colorWhite,
      background: colorLightGreen,
      error: Colors.red,
      onError: Colors.red,
      onSurface: Colors.black,
      surface: Colors.white,
      onBackground: lightPrimary,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: colorLightGreen,
    appBarTheme: AppBarTheme(
      color: lightPrimary,
      elevation: 0,
      iconTheme: IconThemeData(color: colorWhite),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 25,
        color: colorBlack,
        fontWeight: FontWeight.w900,
      ),
      headline2: TextStyle(
        fontSize: 25,
        color: colorWhite,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        fontSize: 20,
        color: lightPrimary,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: TextStyle(
        fontSize: 20,
        color: colorGreen,
        fontWeight: FontWeight.w400,
      ),
      headline4: TextStyle(
        fontSize: 20,
        color: colorLightGreen,
        fontWeight: FontWeight.w400,
      ),
      headline3: TextStyle(
        fontSize: 18,
        color: colorWhite,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 12,
        color: colorBlack,
      ),
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: lightPrimary),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: lightPrimary,
      unselectedItemColor: Colors.grey,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: lightPrimary,
    colorScheme: ColorScheme(
      primary: colorBlack,
      onPrimary: Color.fromARGB(255, 53, 53, 53),
      secondary: colorBlack,
      onSecondary: colorWhite,
      background: colorBlack,
      error: Colors.red,
      onError: Colors.red,
      onSurface: colorWhite,
      surface: Colors.black,
      onBackground: colorBlack,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: colorBlack,
    appBarTheme: AppBarTheme(
      color: colorBlack,
      elevation: 0,
      iconTheme: IconThemeData(color: colorBlack),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        color: colorWhite,
        fontWeight: FontWeight.w700,
      ),
      subtitle1: TextStyle(
        fontSize: 20,
        color: lightPrimary,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: TextStyle(
        fontSize: 20,
        color: colorGreen,
        fontWeight: FontWeight.w400,
      ),
      headline2: TextStyle(
        fontSize: 25,
        color: colorWhite,
        fontWeight: FontWeight.w500,
      ),
      headline3: TextStyle(
        fontSize: 18,
        color: colorWhite,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontSize: 12,
        color: colorWhite,
      ),
      headline4: TextStyle(
        fontSize: 20,
        color: colorLightGreen,
        fontWeight: FontWeight.w400,
      ),
    ),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: lightPrimary),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: lightPrimary,
        unselectedItemColor: Colors.grey,
        backgroundColor: colorBlack),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
}
