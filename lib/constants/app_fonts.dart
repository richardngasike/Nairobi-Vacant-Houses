import 'package:flutter/material.dart';

class AppFonts {
  // Font Sizes
  static const double small = 12.0;
  static const double medium = 16.0;
  static const double large = 20.0;
  static const double extraLarge = 24.0;

  // Font Weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight mediumWeight = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w900;

  // Text Styles
  static const TextStyle headline1 = TextStyle(
    fontSize: extraLarge,
    fontWeight: bold,
    color: Colors.black, // Example color
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: medium,
    fontWeight: regular,
    color: Colors.black, // Example color
  );

  static const TextStyle caption = TextStyle(
    fontSize: small,
    fontWeight: light,
    color: Colors.grey, // Example color
  );
}
