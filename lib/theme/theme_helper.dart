import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';

String _appTheme = "primary";

class ThemeHelper {
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  PrimaryColors _getThemeColors() {
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  ThemeData _getThemeData() {
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.whiteA700,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: appTheme.gray700,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: appTheme.black90001.withOpacity(0.25),
      ),
    );
  }

  PrimaryColors themeColor() => _getThemeColors();
  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.gray900,
          fontSize: 16.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black90001,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black90001,
          fontSize: 10.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 36.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 28.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w300,
        ),
        titleLarge: TextStyle(
          color: colorScheme.onErrorContainer,
          fontSize: 20.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        titleSmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      );
}

class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    primary: Color(0XFFF5F5F5),
    primaryContainer: Color(0XFF565559),
    secondaryContainer: Color(0X660F141D),
    errorContainer: Color(0XFFD9D9D9),
    onError: Color(0XFF030305),
    onErrorContainer: Color(0XFF222222),
    onPrimary: Color(0XFF3C3C43),
    onPrimaryContainer: Color(0XFF0F0F0F),
    onSecondaryContainer: Color(0XFF858080),
  );
}

class PrimaryColors {
  Color get black900 => Color(0XFF010101);
  Color get black90001 => Color(0XFF000000);
  Color get blue800 => Color(0XFF1676B0);
  Color get gray5003f => Color(0X3FA2A2A2);
  Color get gray50Ef => Color(0XEFF9F9F9);
  Color get gray6001e => Color(0X1E767680);
  Color get gray700 => Color(0XFF616161);
  Color get gray900 => Color(0XFF0E131C);
  Color get gray90021 => Color(0X21131313);
  Color get green600 => Color(0XFF34A853);
  Color get lightBlueA700 => Color(0XFF007AFF);
  Color get red500 => Color(0XFFEA4335);
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
