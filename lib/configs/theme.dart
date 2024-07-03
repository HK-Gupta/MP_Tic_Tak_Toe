import 'package:flutter/material.dart';
import 'package:mp_tic_tac_toe/configs/colors.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none
    ),
    fillColor: containerColor,
    filled: true,
    hintStyle: const TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        color: labelColor
    ),
  ),

  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    background: bgColor,
    onBackground: fontColor,
    primaryContainer: containerColor,
    onPrimaryContainer: labelColor,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 18,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        color: fontColor
    ),
    bodyMedium: TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500,
        color: fontColor
    ),
    bodySmall: TextStyle(
        fontSize: 12,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        color: labelColor
    ),
    labelMedium: TextStyle(
        fontSize: 15,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
        color: labelColor,
    ),
  )
);