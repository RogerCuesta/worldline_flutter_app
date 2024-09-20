import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    primaryColor: Colors.white,
    buttonTheme: buttonTheme(),
    iconTheme: iconTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Color.fromARGB(255, 51, 168, 55),
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0XFF8B8B8B)),
    titleTextStyle: TextStyle(
        color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
  );
}

IconThemeData iconTheme() {
  return const IconThemeData(
    color: Colors.black,
    size: 24,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    displayLarge: TextStyle(
        color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
    displaySmall: TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
    bodySmall: TextStyle(color: Colors.black, fontSize: 12),
  );
}

ButtonThemeData buttonTheme() {
  return ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
