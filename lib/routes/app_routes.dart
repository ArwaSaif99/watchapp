import 'package:arwa_s_application1/presentation/sell_watch.dart';
import 'package:flutter/material.dart';
import 'package:arwa_s_application1/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:arwa_s_application1/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:arwa_s_application1/presentation/forgot_password_one_screen/forgot_password_one_screen.dart';
import 'package:arwa_s_application1/presentation/forgot_password_two_screen/forgot_password_two_screen.dart';
import 'package:arwa_s_application1/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:arwa_s_application1/presentation/home_container_screen/home_container_screen.dart';
import 'package:arwa_s_application1/presentation/meneu_screen/meneu_screen.dart';
import 'package:arwa_s_application1/presentation/iphone_13_mini_thirtyfive_screen/iphone_13_mini_thirtyfive_screen.dart';
import 'package:arwa_s_application1/presentation/iphone_13_mini_thirtysix_screen/iphone_13_mini_thirtysix_screen.dart';
import 'package:arwa_s_application1/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String signInScreen = '/sign_in_screen';
  static const String signUpScreen = '/sign_up_screen';
  static const String forgotPasswordOneScreen = '/forgot_password_one_screen';
  static const String forgotPasswordTwoScreen = '/forgot_password_two_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String homePage = '/home_page';
  static const String homeContainerScreen = '/home_container_screen';
  static const String meneuScreen = '/meneu_screen';
  static const String iphone13MiniThirtythreeScreen =
      '/iphone_13_mini_thirtythree_screen';
  static const String iphone13MiniThirtyfiveScreen =
      '/iphone_13_mini_thirtyfive_screen';
  static const String iphone13MiniThirtyfourScreen =
      '/iphone_13_mini_thirtyfour_screen';
  static const String iphone13MiniThirtysixScreen =
      '/iphone_13_mini_thirtysix_screen';
  static const String sellWatch = '/sellWatch';
  static const String appNavigationScreen = '/app_navigation_screen';
  static Map<String, WidgetBuilder> routes = {
    signInScreen: (context) => SignInScreen(),
    signUpScreen: (context) => SignUpScreen(),
    forgotPasswordOneScreen: (context) => ForgotPasswordOneScreen(),
    forgotPasswordTwoScreen: (context) => ForgotPasswordTwoScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    homeContainerScreen: (context) => HomeContainerScreen(),
    meneuScreen: (context) => MeneuScreen(),
    iphone13MiniThirtyfiveScreen: (context) => Iphone13MiniThirtyfiveScreen(),
    iphone13MiniThirtysixScreen: (context) => Iphone13MiniThirtysixScreen(),
    sellWatch: (context) => SellWatch(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
