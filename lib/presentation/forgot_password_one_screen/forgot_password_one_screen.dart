import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/repository/user_repository.dart';
import 'package:arwa_s_application1/validaters.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:arwa_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:arwa_s_application1/widgets/custom_elevated_button.dart';
import 'package:arwa_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordOneScreen extends StatelessWidget {
  ForgotPasswordOneScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

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
                    width: double.maxFinite,
                    child: Column(children: [
                      _buildUserProfile(context),
                      SizedBox(height: 24.v),
                      CustomElevatedButton(
                          text: "Send OTP",
                          margin: EdgeInsets.symmetric(horizontal: 16.h),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              EasyLoading.show(status: 'loading...');
                              UserRepository userRepository = UserRepository(
                                  'https://watchhubuae.com/api/v1');

                              userRepository.resetPassword(
                                  userNameController.text, context);
                            }
                            //  onTapSendOTP(context);
                          }),
                      SizedBox(height: 24.v)
                    ])))));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return SizedBox(
        height: 403.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          CustomImageView(
              imagePath: ImageConstant.imgUntitledDesign378x303,
              height: 378.v,
              width: 303.h,
              alignment: Alignment.topCenter),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 20.h, bottom: 91.v),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Forgot Password?",
                            style: CustomTextStyles.headlineMediumRegular),
                        SizedBox(height: 2.v),
                        Text(
                            "Don’t worry! It happens. Please enter Email Address",
                            style: CustomTextStyles
                                .bodyMediumSourceSansProWhiteA700_1)
                      ]))),
          CustomTextFormField(
              width: 335.h,
              controller: userNameController,
              validator: (value) => validateField(value),
              hintText: "Enter Username or Email",
              textStyle: CustomTextStyles.bodyMediumWhiteA700_1,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.emailAddress,
              alignment: Alignment.bottomCenter,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 13.v, 20.h, 13.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgLock,
                      color: Colors.white,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 50.v),
              contentPadding:
                  EdgeInsets.only(left: 20.h, top: 14.v, bottom: 14.v),
              borderDecoration:
                  TextFormFieldStyleHelper.outlineOnSecondaryContainer,
              filled: true,
              fillColor: theme.colorScheme.onPrimaryContainer),
          CustomImageView(
              imagePath: ImageConstant.imgRectangle158,
              height: 248.v,
              width: 375.h,
              alignment: Alignment.topCenter),
          CustomAppBar(
              height: 34.v,
              leadingWidth: double.maxFinite,
              leading: AppbarLeadingImage(
                  imagePath: ImageConstant.imgArrowLeftPrimary,
                  margin: EdgeInsets.only(left: 20.h, right: 331.h),
                  onTap: () {
                    onTapArrowLeft(context);
                  }),
              title: AppbarSubtitleOne(
                  text: "Back", margin: EdgeInsets.only(left: 40.h)))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the forgotPasswordTwoScreen when the action is triggered.
}
