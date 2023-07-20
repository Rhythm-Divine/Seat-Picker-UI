// ignore_for_file: file_names

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.deepPurple[100],
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: const TextStyle(color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  //const Color(0xff18191a),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color(0xff18191a),
  ),
);
