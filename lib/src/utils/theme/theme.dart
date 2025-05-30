import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter_application_1/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:flutter_application_1/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter_application_1/src/utils/theme/widget_themes/textfield_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: TTextFormTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormTheme.darkInputDecorationTheme,
  );
}
