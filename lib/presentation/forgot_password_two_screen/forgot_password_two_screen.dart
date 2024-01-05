import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/repository/user_repository.dart';
import 'package:arwa_s_application1/validaters.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:arwa_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:arwa_s_application1/widgets/custom_elevated_button.dart';
import 'package:arwa_s_application1/widgets/custom_pin_code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ForgotPasswordTwoScreen extends StatefulWidget {
  @override
  State<ForgotPasswordTwoScreen> createState() =>
      _ForgotPasswordTwoScreenState();
}

String pinCode = '';
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ForgotPasswordTwoScreenState extends State<ForgotPasswordTwoScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final dynamic email = arguments?['email'];

    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.black90001,
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: double.maxFinite,
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    _buildThirtyOne(context),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 8.h),
                                  child: Text("Enter OTP",
                                      style: CustomTextStyles
                                          .headlineMediumRegular)),
                              SizedBox(height: 4.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 8.h),
                                  child: Text(
                                      "An 5 digit code has been sent to given mail ID",
                                      style: CustomTextStyles
                                          .bodyMediumWhiteA700_3)),
                              SizedBox(height: 26.v),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.h),
                                  child: CustomPinCodeTextField(
                                      context: context,
                                      textStyle:
                                          CustomTextStyles.bodyMediumWhiteA700,
                                      validator: (value) =>
                                          validateField(value),
                                      onChanged: (value) {
                                        setState(() {
                                          pinCode = value;
                                          print(pinCode);
                                          print(value);
                                        });
                                      })),
                              SizedBox(height: 24.v),
                              CustomElevatedButton(
                                  text: "Submit",
                                  margin: EdgeInsets.only(left: 8.h),
                                  onPressed: () {
                                    EasyLoading.show(status: 'Loading...');

                                    UserRepository userRepository =
                                        UserRepository(
                                            'https://watchhubuae.com/api/v1');
                                    userRepository.verifyCode(
                                        pinCode, email, context);
                                    // onTapSubmit(context);
                                  }),
                              SizedBox(height: 5.v),
                              TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      print(email);

                                      EasyLoading.show(status: 'Loading...');
                                      UserRepository userRepository =
                                          UserRepository(
                                              'https://watchhubuae.com/api/v1');
                                      userRepository.resendCode(email);
                                    }
                                  },
                                  child: Text('Resend Code'))
                            ]))
                  ]),
                ))));
  }

  /// Section Widget
  Widget _buildThirtyOne(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 6.v),
        decoration: AppDecoration.fillSecondaryContainer1,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(height: 4.v),
          CustomAppBar(
              height: 24.v,
              leadingWidth: double.maxFinite,
              leading: AppbarLeadingImage(
                  imagePath: ImageConstant.imgArrowLeftPrimary,
                  margin: EdgeInsets.only(left: 20.h, right: 331.h),
                  onTap: () {
                    onTapArrowLeft(context);
                  }),
              title: AppbarSubtitleOne(
                  text: "Back", margin: EdgeInsets.only(left: 40.h))),
          SizedBox(height: 32.v),
          CustomImageView(
              imagePath: ImageConstant.imgWatch2, height: 176.v, width: 327.h)
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapSubmit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }
}
