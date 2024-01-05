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
class Iphone13MiniThirtysixScreen extends StatelessWidget {
  Iphone13MiniThirtysixScreen({Key? key}) : super(key: key);

  TextEditingController womenvalueController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 15.v),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 5.v),
                        child: Column(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 17.h),
                                  child: Text("Gender:",
                                      style: theme.textTheme.titleLarge))),
                          SizedBox(height: 8.v),
                          _buildGenderStack(context),
                          SizedBox(height: 15.v),
                          SizedBox(
                              height: 691.v,
                              width: double.maxFinite,
                              child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 17.h),
                                                  child: Text(
                                                      "Year Of Production*",
                                                      style: theme.textTheme
                                                          .titleLarge)),
                                              SizedBox(height: 8.v),
                                              _buildYearOfProductionColumn(
                                                  context),
                                              SizedBox(height: 15.v),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 17.h),
                                                  child: Text("Case Diameter :",
                                                      style: theme.textTheme
                                                          .titleLarge)),
                                              SizedBox(height: 8.v),
                                              _buildCaseDiameterColumn(context),
                                              SizedBox(height: 225.v),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 17.h),
                                                  child: Text("Price:",
                                                      style: theme.textTheme
                                                          .titleLarge)),
                                              SizedBox(height: 8.v),
                                              _buildPriceColumn(context)
                                            ])),
                                    _buildDescriptionFrame(context)
                                  ]))
                        ]))))));
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
                  text: "Basic Info", margin: EdgeInsets.only(left: 76.h))
            ])),
        styleType: Style.bgFill_1);
  }

  /// Section Widget
  Widget _buildGenderStack(BuildContext context) {
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
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 13.v, right: 16.h)),
          CustomTextFormField(
              width: 343.h,
              controller: womenvalueController,
              hintText: "Women",
              alignment: Alignment.topCenter)
        ]));
  }

  /// Section Widget
  Widget _buildYearOfProductionColumn(BuildContext context) {
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
                      margin: EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowDown,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  hintText: "2022",
                  items: dropdownItemList,
                  onChanged: (value) {})
            ]));
  }

  /// Section Widget
  Widget _buildCaseDiameterColumn(BuildContext context) {
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
                      margin: EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowDown,
                          height: 24.adaptSize,
                          width: 24.adaptSize)),
                  hintText: "mm44",
                  items: dropdownItemList1,
                  onChanged: (value) {})
            ]));
  }

  /// Section Widget
  Widget _buildPriceColumn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
                  decoration: AppDecoration.outlineOnSecondaryContainer
                      .copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder10),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("56K", style: theme.textTheme.bodyMedium)),
                    Spacer(),
                    Text("AED", style: theme.textTheme.bodyMedium),
                    CustomImageView(
                        imagePath: ImageConstant.imgArrowDown,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(left: 8.h))
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildDescriptionFrame(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 17.h),
                  child:
                      Text("Description:", style: theme.textTheme.titleLarge))),
          SizedBox(height: 6.v),
          Container(
              padding: EdgeInsets.all(16.h),
              decoration: AppDecoration.outlinePrimary,
              child: CustomTextFormField(
                  controller: descriptionController,
                  hintText:
                      "Lorem ipsum dolor sit amet consectetur. Ipsum facilisi rutrum amet lorem. Ultrices tellus sit sed vestibulum diam cras tempus.",
                  hintStyle: CustomTextStyles.bodyMedium13,
                  textInputAction: TextInputAction.done,
                  maxLines: 3,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 17.h, vertical: 27.v))),
          SizedBox(height: 165.v),
          CustomElevatedButton(
              text: "Next",
              margin: EdgeInsets.symmetric(horizontal: 16.h),
              buttonStyle: CustomButtonStyles.fillBlack,
              buttonTextStyle: CustomTextStyles.bodyLargeWhiteA700_1)
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
