import 'dart:ui';
import 'package:arwa_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButtonStyles {
  static ButtonStyle get fillBlack => ElevatedButton.styleFrom(
        backgroundColor: appTheme.black900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
      );

  static ButtonStyle get outlineGrayTL12 => OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: BorderSide(
          color: appTheme.gray700,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.h),
        ),
      );
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
