import 'package:flutter/material.dart';

abstract class ICoreThemeData {
  final ICoreTextTheme textTheme;
  final ICoreColorScheme colorScheme;
  final ICoreNavigationBarThemeData navigationBarThemeData;
  final ICoreDividerTheme dividerTheme;

  const ICoreThemeData({
    required this.textTheme,
    required this.colorScheme,
    required this.navigationBarThemeData,
    required this.dividerTheme,
  });
}

abstract class ICoreTextTheme {
  const ICoreTextTheme();
}

abstract class ICoreColorScheme {
  final Brightness brightness;

  const ICoreColorScheme({
    required this.brightness,
  });
}

abstract class ICoreNavigationBarThemeData {
  final Color backgroundColor;
  final double height;

  const ICoreNavigationBarThemeData({
    required this.backgroundColor,
    required this.height,
  });
}

abstract class ICoreDividerTheme {
  final Color color;

  const ICoreDividerTheme({
    required this.color,
  });
}
