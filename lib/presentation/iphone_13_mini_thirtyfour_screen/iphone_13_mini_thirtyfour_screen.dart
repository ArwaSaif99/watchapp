import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/models/watch_model.dart';
import 'package:arwa_s_application1/providers/watch_models_provider.dart';
import 'package:arwa_s_application1/repository/watche_repository.dart';
import 'package:arwa_s_application1/validaters.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:arwa_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:arwa_s_application1/widgets/custom_drop_down.dart';
import 'package:arwa_s_application1/widgets/custom_outlined_button.dart';
import 'package:arwa_s_application1/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// ignore_for_file: must_be_immutable
class Iphone13MiniThirtyfourScreen extends StatefulWidget {
  Iphone13MiniThirtyfourScreen({Key? key, required this.watch})
      : super(key: key);
  final Watch watch;

  @override
  State<Iphone13MiniThirtyfourScreen> createState() =>
      _Iphone13MiniThirtyfourScreenState();
}

class _Iphone13MiniThirtyfourScreenState
    extends State<Iphone13MiniThirtyfourScreen> {
  List<String> gender = [
    "Male",
    "Female",
  ];

  TextEditingController priceController = TextEditingController();

  TextEditingController yearController = TextEditingController();

  TextEditingController caseDiameterController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  String? selectedGender;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                        child: Form(
                          key: _formKey,
                          child: Column(children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 17.h),
                                    child: Text("Gender:",
                                        style: theme.textTheme.titleLarge))),
                            SizedBox(height: 8.v),
                            _buildGender(context),
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
                                                _buildYearOfProduction(context),
                                                SizedBox(height: 15.v),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 17.h),
                                                    child: Text(
                                                        "Case Diameter :",
                                                        style: theme.textTheme
                                                            .titleLarge)),
                                                SizedBox(height: 8.v),
                                                _buildCaseDiameter(context),
                                                SizedBox(height: 225.v),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 17.h),
                                                    child: Text("Price:",
                                                        style: theme.textTheme
                                                            .titleLarge)),
                                                SizedBox(height: 8.v),
                                                _buildPrice(context)
                                              ])),
                                      _buildDescription(context)
                                    ]))
                          ]),
                        ))))));
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
  Widget _buildGender(BuildContext context) {
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
                  items: gender,
                  onChanged: (value) {
                    selectedGender = value;
                  })
            ]));
  }

  /// Section Widget
  Widget _buildYearOfProduction(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              CustomTextFormField(
                  controller: yearController,
                  validator: (value) => validateField(value),
                  textInputAction: TextInputAction.done),
            ]));
  }

  /// Section Widget
  Widget _buildCaseDiameter(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              CustomTextFormField(
                  controller: caseDiameterController,
                  validator: (value) => validateField(value),
                  textInputAction: TextInputAction.done),
            ]));
  }

  /// Section Widget
  Widget _buildPrice(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              CustomTextFormField(
                controller: priceController,
                validator: (value) => validateField(value),
              )
            ]));
  }

  /// Section Widget
  Widget _buildDescription(BuildContext context) {
    // Watch watchModel = ModalRoute.of(context)!.settings.arguments as Watch;

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
                  validator: (value) => validateField(value),
                  textInputAction: TextInputAction.done)),
          SizedBox(height: 165.v),
          CustomOutlinedButton(
              text: "Next",
              margin: EdgeInsets.symmetric(horizontal: 16.h),
              buttonStyle: CustomButtonStyles.outlineGrayTL12,
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  EasyLoading.show(status: 'Loading...');
                  WactchRepository wactchRepository = WactchRepository();
                  Watch watch = Watch(
                    id: 1,
                    name: 'watch 1',
                    description: descriptionController.text,
                    brandId: widget.watch.brandId,
                    watchModelId: widget.watch.watchModelId,
                    userId: 1,
                    userName: 'ss',
                    brandName: widget.watch.brandName,
                    watchModelName: widget.watch.brandName,
                    caseDiameter: double.parse(caseDiameterController.text),
                    caseMaterial: 'test ca',
                    strapMaterial: 'test st',
                    price: double.parse(
                      priceController.text,
                    ),
                    color: widget.watch.color,
                    model: 'aaa',
                    referenceNumber: widget.watch.referenceNumber,
                    serialNumber: widget.watch.serialNumber,
                    gender: selectedGender,
                    yearOfProduction: yearController.text,
                    condition: widget.watch.condition,
                    cityId: widget.watch.cityId,
                    cityName: widget.watch.cityName,
                    packageId: 1,
                    packageName: 'aaa',
                    packagePrice: 222,
                    packageDays: 11,
                    callNumber: '0599999999',
                    whatsappNumber: '+971599999999',
                    images: 'hh',
                    expirationDate: DateTime.now(),
                    status: 'active',
                    createdAt: DateTime.now(),
                  );
                  wactchRepository.addWatch(watch, context);
                  // onTapNext(context);
                }
              })
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the iphone13MiniThirtysixScreen when the action is triggered.
  onTapNext(BuildContext context) {
    // Navigator.pushNamed(context, AppRoutes.iphone13MiniThirtysixScreen);
  }
}
