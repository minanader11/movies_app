import 'package:flutter/material.dart';

class MyTheme {
  static const Color blackColor = Color(0xff121312);
  static const Color goldColor = Color(0xffFFBB3B);
  static const Color grayColor = Color(0xffB5B4B4);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color darkGray = Color(0xff282A28);
  static const Color appBarColor = Color(0xff1D1E1D);
  static const Color searchBarColor = Color(0xff514F4F);

  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: blackColor,
    appBarTheme: const AppBarTheme(
        color: appBarColor,
        titleTextStyle: TextStyle(color: whiteColor,fontSize: 20),
        actionsIconTheme: IconThemeData(color: whiteColor),
        iconTheme: IconThemeData(color: whiteColor)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showUnselectedLabels: true,
        backgroundColor: blackColor,
        selectedItemColor: goldColor,
        unselectedItemColor: grayColor,
        selectedIconTheme: IconThemeData(
          size: 30,
        ),
        selectedLabelStyle: TextStyle(fontSize: 8),
        unselectedLabelStyle: TextStyle(fontSize: 8)),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
    ),
  );
}
