import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromARGB(255, 127, 117, 148),
  appBarTheme: const AppBarTheme(
      color: Color.fromARGB(255, 127, 117, 148),
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 236, 228, 251),
          fontSize: 32,
          fontFamily: 'Pacifico')),
  primaryColor: Colors.white,
  secondaryHeaderColor: const Color.fromARGB(255, 185, 185, 185),
  primaryColorDark: const Color(0xff434343),
  shadowColor: Colors.grey,
  cardColor: const Color.fromARGB(255, 236, 228, 251),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color.fromARGB(255, 154, 144, 179),
    elevation: 3,
  ),
  tabBarTheme: const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    indicator: BoxDecoration(
        color: Color.fromARGB(255, 127, 117, 148),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(27), topRight: Radius.circular(27))),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 73, 67, 85),
      fontSize: 28,
      fontFamily: 'ABeeZee',
    ),
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 73, 67, 85),
      fontSize: 23,
      fontFamily: 'ABeeZee',
    ),
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 73, 67, 85),
      fontSize: 19,
      fontFamily: 'ABeeZee',
    ),
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 128, 118, 148),
      fontSize: 19,
      fontFamily: 'ABeeZee',
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 128, 118, 148),
      fontSize: 16,
      fontFamily: 'ABeeZee',
    ),
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 128, 118, 148),
      fontSize: 13,
      fontFamily: 'ABeeZee',
    ),
  ),
  primaryTextTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 28,
    ),
    titleMedium: TextStyle(
      fontSize: 24,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
    ),
  ),
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(color: Colors.white10),
  pageTransitionsTheme: const PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder()
    // CupertinoPageTransitionsBuilder()
  }),
);
