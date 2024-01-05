import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/repository/user_repository.dart';
import 'package:arwa_s_application1/validaters.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:arwa_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:arwa_s_application1/widgets/custom_elevated_button.dart';
import 'package:arwa_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:arwa_s_application1/presentation/success_dialog/success_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController newpasswordController1 = TextEditingController();

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
                      _buildForgotPasswordStack(context),
                      _buildNewPasswordColumn(context)
                    ])))));
  }

  /// Section Widget
  Widget _buildForgotPasswordStack(BuildContext context) {
    return SizedBox(
        height: 403.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                  height: 359.v,
                  width: 297.h,
                  child: Stack(alignment: Alignment.bottomLeft, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgDesignDc011e6b,
                        height: 359.v,
                        width: 297.h,
                        alignment: Alignment.center),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                            height: 81.v,
                            width: 170.h,
                            margin: EdgeInsets.only(left: 7.h, bottom: 8.v),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.onError)))
                  ]))),
          CustomAppBar(
              height: 289.v,
              leadingWidth: double.maxFinite,
              leading: AppbarLeadingImage(
                  imagePath: ImageConstant.imgArrowLeftPrimary,
                  margin: EdgeInsets.fromLTRB(20.h, 10.v, 331.h, 255.v),
                  onTap: () {
                    onTapArrowLeft(context);
                  }),
              title: AppbarSubtitleOne(
                  text: "Back",
                  margin:
                      EdgeInsets.only(left: 40.h, top: 12.v, bottom: 256.v)),
              styleType: Style.bgFill),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 20.h, bottom: 91.v),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reset Password",
                            style: CustomTextStyles.headlineMediumRegular),
                        SizedBox(height: 5.v),
                        Text("Please enter new password.",
                            style: CustomTextStyles
                                .bodyMediumSourceSansProWhiteA700_1)
                      ]))),
          CustomTextFormField(
              width: 335.h,
              controller: newpasswordController,
              hintText: "New Password",
              textStyle: CustomTextStyles.bodyMediumWhiteA700_1,
              validator: validateField,
              hintStyle: CustomTextStyles.bodyLargeSourceSansProWhiteA700,
              textInputType: TextInputType.visiblePassword,
              alignment: Alignment.bottomCenter,
              obscureText: true,
              borderDecoration:
                  TextFormFieldStyleHelper.outlineOnSecondaryContainer,
              filled: true,
              fillColor: theme.colorScheme.onPrimaryContainer)
        ]));
  }

  /// Section Widget
  Widget _buildNewPasswordColumn(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final dynamic email = arguments?['email'];
    final dynamic code = arguments?['code'];
    return Container(
        padding: EdgeInsets.all(16.h),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.h),
              child: CustomTextFormField(
                  controller: newpasswordController1,
                  hintText: "Confirm New Password ",
                  textStyle: CustomTextStyles.bodyMediumWhiteA700_1,
                  validator: (value) =>
                      validatePassword(value, newpasswordController.text),
                  hintStyle: CustomTextStyles.bodyLargeSourceSansProWhiteA700,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true,
                  borderDecoration:
                      TextFormFieldStyleHelper.outlineOnSecondaryContainer,
                  filled: true,
                  fillColor: theme.colorScheme.onPrimaryContainer)),
          SizedBox(height: 24.v),
          CustomElevatedButton(
              text: "Submit",
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  EasyLoading.show(status: 'Loading...');

                  UserRepository userRepository =
                      UserRepository('https://watchhubuae.com/api/v1');
                  userRepository.resetPasswordA(email, code,
                      newpasswordController.text, newpasswordController1.text);
                  //  onTapSubmit(context);
                }
              }),
          SizedBox(height: 5.v)
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Displays a dialog with the [SuccessDialog] content.
  onTapSubmit(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: SuccessDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
