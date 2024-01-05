import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/repository/user_repository.dart';
import 'package:arwa_s_application1/validaters.dart';
import 'package:arwa_s_application1/widgets/custom_elevated_button.dart';
import 'package:arwa_s_application1/widgets/custom_icon_button.dart';
import 'package:arwa_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends StatelessWidget {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  SignInScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.black900,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    height: 768.v,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.center, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgUntitledDesign,
                          height: 422.v,
                          width: 375.h,
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 19.v)),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.h, vertical: 15.v),
                              decoration: AppDecoration.fillSecondaryContainer,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 9.h),
                                            child: Text("As a Guest",
                                                style: CustomTextStyles
                                                    .bodyLargeInterWhiteA700
                                                    .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .underline)))),
                                    Spacer(),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgSettings,
                                        height: 53.v,
                                        width: 84.h,
                                        margin: EdgeInsets.only(left: 4.h)),
                                    SizedBox(height: 33.v),
                                    Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Text("Let’s Sign in",
                                            style: CustomTextStyles
                                                .headlineMediumRegular)),
                                    Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Text(
                                            "Fill the details below to continue.",
                                            style: CustomTextStyles
                                                .bodyMediumWhiteA700_3)),
                                    SizedBox(height: 35.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.h),
                                        child: CustomTextFormField(
                                          controller: userNameController,
                                          hintText: "Enter Username or Email",
                                          validator: (value) =>
                                              validateField(value),
                                          hintStyle: CustomTextStyles
                                              .bodyMediumWhiteA700_1,
                                          textInputType:
                                              TextInputType.emailAddress,
                                          suffix: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  30.h, 13.v, 20.h, 13.v),
                                              child: CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgLock,
                                                  color: Colors.white,
                                                  height: 24.adaptSize,
                                                  width: 24.adaptSize)),
                                          suffixConstraints:
                                              BoxConstraints(maxHeight: 50.v),
                                          contentPadding: EdgeInsets.only(
                                              left: 20.h,
                                              top: 14.v,
                                              bottom: 14.v),
                                          textStyle: CustomTextStyles
                                              .bodyMediumWhiteA700_1,
                                          borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .outlineOnSecondaryContainer,
                                          filled: true,
                                          fillColor: theme
                                              .colorScheme.onPrimaryContainer,
                                        )),
                                    SizedBox(height: 16.v),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.h),
                                        child: CustomTextFormField(
                                            controller: passwordController,
                                            hintText: "Enter Password",
                                            validator: (value) =>
                                                validateField(value),
                                            hintStyle: CustomTextStyles
                                                .bodyMediumWhiteA700,
                                            textInputAction:
                                                TextInputAction.done,
                                            textInputType:
                                                TextInputType.visiblePassword,
                                            suffix: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    30.h, 13.v, 20.h, 13.v),
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgSettingsOnsecondarycontainer,
                                                    color: Colors.white,
                                                    height: 24.adaptSize,
                                                    width: 24.adaptSize)),
                                            suffixConstraints:
                                                BoxConstraints(maxHeight: 50.v),
                                            obscureText: true,
                                            contentPadding: EdgeInsets.only(
                                                left: 20.h,
                                                top: 14.v,
                                                bottom: 14.v),
                                            textStyle: CustomTextStyles
                                                .bodyMediumWhiteA700_1,
                                            borderDecoration:
                                                TextFormFieldStyleHelper
                                                    .outlineOnSecondaryContainer,
                                            filled: true,
                                            fillColor: theme.colorScheme
                                                .onPrimaryContainer)),
                                    SizedBox(height: 29.v),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              onTapTxtFogotPassword(context);
                                            },
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(right: 4.h),
                                                child: Text("Fogot Password?",
                                                    style: CustomTextStyles
                                                        .bodyMediumWhiteA700_3)))),
                                    SizedBox(height: 21.v),
                                    CustomElevatedButton(
                                        text: "Sign in",
                                        onPressed: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            EasyLoading.show(
                                                status: 'loading...');
                                            UserRepository userRepository =
                                                UserRepository(
                                                    'https://watchhubuae.com/api/v1');

                                            userRepository.loginUser(
                                                userNameController.text,
                                                passwordController.text,
                                                '',
                                                context);
                                            //  onTapSignUp(context);
                                          }
                                          // onTapSignIn(context);
                                        }),
                                    SizedBox(height: 8.v),
                                    Align(
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                            height: 120.v,
                                            width: 214.h,
                                            child: Stack(
                                                alignment: Alignment.topRight,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 12.h,
                                                                  right: 9.h),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text("OR",
                                                                    style: CustomTextStyles
                                                                        .bodyMediumWhiteA700_3),
                                                                SizedBox(
                                                                    height:
                                                                        15.v),
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                          padding: EdgeInsets.only(
                                                                              bottom: 2
                                                                                  .v),
                                                                          child: CustomIconButton(
                                                                              height: 45.adaptSize,
                                                                              width: 45.adaptSize,
                                                                              padding: EdgeInsets.all(9.h),
                                                                              child: CustomImageView(imagePath: ImageConstant.imgFacebook))),
                                                                      Padding(
                                                                          padding: EdgeInsets.only(
                                                                              left: 15.h,
                                                                              top: 1.v,
                                                                              bottom: 1.v),
                                                                          child: CustomIconButton(
                                                                              height: 45.adaptSize,
                                                                              width: 45.adaptSize,
                                                                              padding: EdgeInsets.all(9.h),
                                                                              child: CustomImageView(
                                                                                imagePath: ImageConstant.imgGoogle,
                                                                                onTap: () {
                                                                                  _handleGoogleSignIn();
                                                                                },
                                                                              ))),
                                                                      Container(
                                                                          height: 46
                                                                              .v,
                                                                          width: 45
                                                                              .h,
                                                                          margin: EdgeInsets.only(
                                                                              left: 15.h,
                                                                              top: 1.v),
                                                                          child: Stack(alignment: Alignment.bottomCenter, children: [
                                                                            CustomIconButton(
                                                                                height: 45.adaptSize,
                                                                                width: 45.adaptSize,
                                                                                alignment: Alignment.center,
                                                                                child: CustomImageView()),
                                                                            CustomImageView(
                                                                                imagePath: ImageConstant.imgEvaEmailFill,
                                                                                height: 26.adaptSize,
                                                                                width: 26.adaptSize,
                                                                                alignment: Alignment.bottomCenter)
                                                                          ]))
                                                                    ]),
                                                                SizedBox(
                                                                    height:
                                                                        16.v),
                                                                GestureDetector(
                                                                    onTap: () {
                                                                      onTapTxtNewtobcdwatch(
                                                                          context);
                                                                    },
                                                                    child: RichText(
                                                                        text: TextSpan(children: [
                                                                          TextSpan(
                                                                              text: "New to ",
                                                                              style: CustomTextStyles.bodyMediumWhiteA700_1),
                                                                          TextSpan(
                                                                              text: "BCD ",
                                                                              style: CustomTextStyles.bodyMediumWhiteA700_1),
                                                                          TextSpan(
                                                                              text: "Watch",
                                                                              style: CustomTextStyles.bodyMediumWhiteA700_1),
                                                                          TextSpan(
                                                                              text: "? ",
                                                                              style: CustomTextStyles.bodyMediumSourceSansProWhiteA700),
                                                                          TextSpan(
                                                                              text: "Sign up",
                                                                              style: theme.textTheme.titleSmall)
                                                                        ]),
                                                                        textAlign: TextAlign.left))
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 12.v),
                                                          child: SizedBox(
                                                              width: 82.h,
                                                              child: Divider(
                                                                  color: appTheme
                                                                      .whiteA700)))),
                                                  Align(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 12.v),
                                                          child: SizedBox(
                                                              width: 82.h,
                                                              child: Divider(
                                                                  color: appTheme
                                                                      .whiteA700))))
                                                ]))),
                                    SizedBox(height: 38.v)
                                  ])))
                    ])))));
  }

  /// Navigates to the forgotPasswordOneScreen when the action is triggered.
  onTapTxtFogotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordOneScreen);
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapTxtNewtobcdwatch(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }

  Future<void> _handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      final GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
      print('ddddddddddddddddddddddddddddddddddddddddddd');
      UserRepository userRepository =
          UserRepository('https://api.postman.com/api/v1');
      // Now, you can use the data from googleUser to call your loginBySocial function
      userRepository.loginBySocial(
        googleUser!.displayName ?? '',
        '',
        googleUser.email,
        googleUser.photoUrl ?? '',
        'google', // or the appropriate provider
        googleUser.id,
        '', // FCM token, you might get this separately
        'android', // or 'ios'
      );
    } catch (error) {
      print('Error during Google Sign-In: $error');
    }
  }
}
