import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomTextStyles {
  static get bodyLargeBlack90001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
        fontSize: 17.fSize,
      );
  static get bodyLargeBlack90001_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black90001,
      );
  static get bodyLargeGray700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray700,
      );
  static get bodyLargeInterPrimary => theme.textTheme.bodyLarge!.inter.copyWith(
        color: theme.colorScheme.primary,
      );
  static get bodyLargeInterWhiteA700 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargeLightblueA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.lightBlueA700,
        fontSize: 17.fSize,
      );
  static get bodyLargeOnErrorContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  static get bodyLargeOnPrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(0.6),
        fontSize: 17.fSize,
      );
  static get bodyLargeSourceSansProBlack90001 =>
      theme.textTheme.bodyLarge!.sourceSansPro.copyWith(
        color: appTheme.black90001,
        fontSize: 18.fSize,
      );
  static get bodyLargeSourceSansProWhiteA700 =>
      theme.textTheme.bodyLarge!.sourceSansPro.copyWith(
        color: appTheme.whiteA700.withOpacity(0.5),
      );
  static get bodyLargeWhiteA700 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyLargeWhiteA700_1 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMediumOnErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
      );
  static get bodyMediumSourceSansProWhiteA700 =>
      theme.textTheme.bodyMedium!.sourceSansPro.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumSourceSansProWhiteA700_1 =>
      theme.textTheme.bodyMedium!.sourceSansPro.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumWhiteA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700.withOpacity(0.75),
      );
  static get bodyMediumWhiteA700_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get bodyMediumWhiteA700_2 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700.withOpacity(0.5),
      );
  static get bodyMediumWhiteA700_3 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get headlineMediumRegular => theme.textTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w400,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get sourceSansPro {
    return copyWith(
      fontFamily: 'Source Sans Pro',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
