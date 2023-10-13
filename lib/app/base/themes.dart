import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/app/widgets/my_under_line_tab_indicator.dart';

import 'app_colors.dart';

final Map<String, ThemeData> themes = {
  "dark": ThemeData.dark().copyWith(
    primaryColor: AppColors.cffff3eea,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    splashFactory: NoSplash.splashFactory,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(splashFactory: NoSplash.splashFactory),
    ),
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(splashFactory: NoSplash.splashFactory),
    ),
    indicatorColor: const Color(0xffe6abff),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.grey,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Color(0xff707070),
      selectedLabelStyle: TextStyle(fontSize: 10),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      type: BottomNavigationBarType.fixed,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0.2,
      backgroundColor: Color(0xffffffff),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelColor: Color(0xff9b9b9b),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: MyUnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: Color(0xffe6abff),
        ),
        indicatorWidth: 30,
        indicatorTop: 5,
      ),
    ),
  ),
  "light": ThemeData.light().copyWith()
};
