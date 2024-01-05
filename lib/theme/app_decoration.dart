import 'package:flutter/material.dart';
import 'package:arwa_s_application1/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900,
      );
  static BoxDecoration get fillBlack90001 => BoxDecoration(
        color: appTheme.black90001,
      );
  static BoxDecoration get fillBlack900011 => BoxDecoration(
        color: appTheme.black90001.withOpacity(0.35),
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary,
      );
  static BoxDecoration get fillSecondaryContainer => BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
      );
  static BoxDecoration get fillSecondaryContainer1 => BoxDecoration(
        color: theme.colorScheme.secondaryContainer.withOpacity(0.13),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  static BoxDecoration get outlineBlack => BoxDecoration();
  static BoxDecoration get outlineOnSecondaryContainer => BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onSecondaryContainer,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary,
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  static BorderRadius get circleBorder43 => BorderRadius.circular(
        43.h,
      );

  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;
double get strokeAlignCenter => BorderSide.strokeAlignCenter;
double get strokeAlignOutside => BorderSide.strokeAlignOutside;
