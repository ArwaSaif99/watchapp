import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:arwa_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:arwa_s_application1/widgets/custom_drop_down.dart';
import 'package:arwa_s_application1/widgets/custom_elevated_button.dart';
import 'package:arwa_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class Iphone13MiniThirtyfiveScreen extends StatelessWidget {
  Iphone13MiniThirtyfiveScreen({Key? key}) : super(key: key);

  TextEditingController keySixController = TextEditingController();

  TextEditingController keyEightController = TextEditingController();

  TextEditingController keyTenController = TextEditingController();

  TextEditingController keyTwelveController = TextEditingController();

  TextEditingController keyTenController1 = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      SizedBox(height: 30.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 5.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.h),
                                            child: Text(
                                                "Add Pic For Your Watch:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 2.v),
                                        _buildPicForYour(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.h),
                                            child: Text("Brand:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildThirty(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.h),
                                            child: Text("Model:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildTwentyNine(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.h),
                                            child: Text("Reference Number:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildThirtyThree(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.h),
                                            child: Text("Condition*",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildThirtyFive(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.h),
                                            child: Text("Serial Number",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildThirtySeven(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.h),
                                            child: Text("Color:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildForty(context)
                                      ]))))
                    ]))),
            bottomNavigationBar: _buildNext(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 23.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 9.h, top: 8.v, bottom: 7.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: Padding(
            padding: EdgeInsets.only(left: 9.h),
            child: Row(children: [
              AppbarSubtitle(text: "Back"),
              AppbarTitle(
                  text: "Watch Details", margin: EdgeInsets.only(left: 58.h))
            ])),
        styleType: Style.bgFill_1);
  }

  /// Section Widget
  Widget _buildPicForYour(BuildContext context) {
    return SizedBox(
        height: 247.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgRectangle5648,
              height: 247.v,
              width: 375.h,
              alignment: Alignment.center),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: 24.v,
                  width: 57.h,
                  margin: EdgeInsets.only(bottom: 8.v),
                  child: Stack(alignment: Alignment.center, children: [
                    Opacity(
                        opacity: 0.5,
                        child: Align(
                            alignment: Alignment.center,
                            child: Container(
                                height: 24.v,
                                width: 57.h,
                                decoration: BoxDecoration(
                                    color: appTheme.black900.withOpacity(0.53),
                                    borderRadius:
                                        BorderRadius.circular(10.h))))),
                    Align(
                        alignment: Alignment.center,
                        child: Text("1/8",
                            style: CustomTextStyles.bodyLargeWhiteA700))
                  ])))
        ]));
  }

  /// Section Widget
  Widget _buildKeySix(BuildContext context) {
    return CustomTextFormField(controller: keySixController, hintText: "Rolex");
  }

  /// Section Widget
  Widget _buildThirty(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 3.v), _buildKeySix(context)]));
  }

  /// Section Widget
  Widget _buildKeyEight(BuildContext context) {
    return CustomTextFormField(
        controller: keyEightController, hintText: "GTM-Matrix");
  }

  /// Section Widget
  Widget _buildTwentyNine(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 3.v), _buildKeyEight(context)]));
  }

  /// Section Widget
  Widget _buildKeyTen(BuildContext context) {
    return CustomTextFormField(
        controller: keyTenController,
        hintText: "02023102",
        textInputType: TextInputType.phone);
  }

  /// Section Widget
  Widget _buildThirtyThree(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 3.v), _buildKeyTen(context)]));
  }

  /// Section Widget
  Widget _buildKeyTwelve(BuildContext context) {
    return CustomTextFormField(
        width: 343.h,
        controller: keyTwelveController,
        hintText: "New",
        alignment: Alignment.topCenter);
  }

  /// Section Widget
  Widget _buildThirtyFive(BuildContext context) {
    return Container(
        height: 87.v,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Stack(alignment: Alignment.topCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgArrowDown,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 18.h)),
          _buildKeyTwelve(context)
        ]));
  }

  /// Section Widget
  Widget _buildKeyTen1(BuildContext context) {
    return CustomTextFormField(
        controller: keyTenController1,
        hintText: "02023102",
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.phone);
  }

  /// Section Widget
  Widget _buildThirtySeven(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 3.v), _buildKeyTen1(context)]));
  }

  /// Section Widget
  Widget _buildForty(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              CustomDropDown(
                  icon: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 13.v, 10.h, 13.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowDown,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  hintText: "Black",
                  items: dropdownItemList,
                  onChanged: (value) {})
            ]));
  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
        text: "Next",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 43.v),
        buttonStyle: CustomButtonStyles.fillBlack,
        buttonTextStyle: CustomTextStyles.bodyLargeWhiteA700_1,
        onPressed: () {
          onTapNext(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the iphone13MiniThirtyfourScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.iphone13MiniThirtyfourScreen);
  }
}
