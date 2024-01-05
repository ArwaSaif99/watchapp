import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/repository/user_repository.dart';
import 'package:arwa_s_application1/validaters.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:arwa_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:arwa_s_application1/widgets/custom_elevated_button.dart';
import 'package:arwa_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

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
                          imagePath: ImageConstant.imgSubtract,
                          height: 537.v,
                          width: 209.h,
                          alignment: Alignment.topRight),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15.v),
                              decoration: AppDecoration.fillSecondaryContainer,
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _buildAppBar(context),
                                    Spacer(),
                                    CustomImageView(
                                        imagePath: ImageConstant.imgSettings,
                                        height: 53.v,
                                        width: 84.h,
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(left: 20.h)),
                                    SizedBox(height: 33.v),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.h),
                                            child: Text("Let’s Sign up",
                                                style: CustomTextStyles
                                                    .headlineMediumRegular))),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.h),
                                            child: Text(
                                                "Let’s sign up to get rewards",
                                                style: CustomTextStyles
                                                    .bodyMediumWhiteA700_3))),
                                    SizedBox(height: 33.v),
                                    _buildUserName(context),
                                    SizedBox(height: 16.v),
                                    _buildName(context),
                                    SizedBox(height: 16.v),
                                    _buildPassword(context),
                                    SizedBox(height: 15.v),
                                    _buildConfirmPassword(context),
                                    SizedBox(height: 24.v),
                                    _buildSignUp(context),
                                    SizedBox(height: 18.v),
                                    GestureDetector(
                                        onTap: () {
                                          UserRepository userRepository =
                                              UserRepository('');
                                          onTapTxtJoinedusbefore(context);
                                        },
                                        child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: "Joined us before",
                                                  style: CustomTextStyles
                                                      .bodyMediumWhiteA700_1),
                                              TextSpan(
                                                  text: "? ",
                                                  style: CustomTextStyles
                                                      .bodyMediumSourceSansProWhiteA700),
                                              TextSpan(
                                                  text: "Sign in",
                                                  style: theme
                                                      .textTheme.titleSmall)
                                            ]),
                                            textAlign: TextAlign.left)),
                                    SizedBox(height: 48.v)
                                  ])))
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(height: 20.v, actions: [
      AppbarSubtitleTwo(
          text: "As a Guest", margin: EdgeInsets.symmetric(horizontal: 26.h))
    ]);
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: CustomTextFormField(
            controller: userNameController,
            hintText: "Enter Username or Email",
            validator: (value) => validateField(value),
            textInputType: TextInputType.emailAddress,
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 13.v, 20.h, 13.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgLock,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 50.v),
            contentPadding:
                EdgeInsets.only(left: 20.h, top: 14.v, bottom: 14.v),
            borderDecoration:
                TextFormFieldStyleHelper.outlineOnSecondaryContainer,
            filled: true,
            fillColor: theme.colorScheme.onPrimaryContainer));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: CustomTextFormField(
            controller: nameController,
            hintText: "Name",
            validator: (value) => validateField(value),
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 15.v, 23.h, 15.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgLockPrimarycontainer,
                    height: 19.v,
                    width: 18.h)),
            suffixConstraints: BoxConstraints(maxHeight: 50.v),
            contentPadding:
                EdgeInsets.only(left: 20.h, top: 14.v, bottom: 14.v),
            borderDecoration:
                TextFormFieldStyleHelper.outlineOnSecondaryContainer,
            filled: true,
            fillColor: theme.colorScheme.onPrimaryContainer));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: CustomTextFormField(
            controller: passwordController,
            hintText: "Enter Password",
            validator: (value) => validateField(value),
            textInputType: TextInputType.visiblePassword,
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 13.v, 20.h, 13.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgSettingsOnsecondarycontainer,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 50.v),
            obscureText: true,
            contentPadding:
                EdgeInsets.only(left: 20.h, top: 14.v, bottom: 14.v),
            borderDecoration:
                TextFormFieldStyleHelper.outlineOnSecondaryContainer,
            filled: true,
            fillColor: theme.colorScheme.onPrimaryContainer));
  }

  /// Section Widget
  Widget _buildConfirmPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 19.h),
        child: CustomTextFormField(
            controller: confirmPasswordController,
            hintText: "Confirm Password",
            validator: (value) =>
                validatePassword(value, passwordController.text),
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: Container(
                margin: EdgeInsets.fromLTRB(30.h, 13.v, 20.h, 13.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgSettingsOnsecondarycontainer,
                    height: 24.adaptSize,
                    width: 24.adaptSize)),
            suffixConstraints: BoxConstraints(maxHeight: 50.v),
            obscureText: true,
            contentPadding:
                EdgeInsets.only(left: 20.h, top: 14.v, bottom: 14.v),
            borderDecoration:
                TextFormFieldStyleHelper.outlineOnSecondaryContainer,
            filled: true,
            fillColor: theme.colorScheme.onPrimaryContainer));
  }

  /// Section Widget
  Widget _buildSignUp(BuildContext context) {
    return CustomElevatedButton(
        text: "Sign up",
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            EasyLoading.show(status: 'loading...');
            UserRepository userRepository =
                UserRepository('https://watchhubuae.com/api/v1');

            userRepository.registerUser(
                name: nameController.text,
                email: userNameController.text,
                password: passwordController.text,
                confirmPassword: confirmPasswordController.text,
                mobile: '',
                profileImage: '',
                fcmToken: '',
                context: context);
            //  onTapSignUp(context);
          }
        });
  }

  /// Navigates to the homeContainerScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeContainerScreen);
  }

  /// Navigates to the signInScreen when the action is triggered.
  onTapTxtJoinedusbefore(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInScreen);
  }
}
