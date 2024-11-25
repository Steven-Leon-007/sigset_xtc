import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Raleway',
    textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: "Raleway")),
    colorScheme: ColorScheme.light(
        surface: Color.fromARGB(255, 221, 221, 221),
        primary: Colors.black,
        secondary: Colors.white,
        primaryContainer: Color(0xFFB00020),
        secondaryContainer: Color.fromARGB(255, 162, 162, 162),
        surfaceContainerLow: Color.fromARGB(255, 149, 149, 149),
        tertiaryContainer: Color.fromARGB(255, 22, 22, 22)));

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(bodyMedium: TextStyle(fontFamily: "Raleway")),
    colorScheme: ColorScheme.dark(
        surface: Color.fromARGB(255, 17, 13, 17),
        primary: Colors.white,
        secondary: Colors.black,
        primaryContainer: Color(0xFFB00020),
        secondaryContainer: Color.fromARGB(255, 30, 30, 30),
        surfaceContainerLow: Color.fromARGB(255, 19, 19, 19),
        tertiaryContainer: Color.fromARGB(255, 217, 217, 217)));
