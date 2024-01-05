import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/models/watch_model.dart';
import 'package:arwa_s_application1/models/watch_models.dart';
import 'package:arwa_s_application1/presentation/iphone_13_mini_thirtyfour_screen/iphone_13_mini_thirtyfour_screen.dart';
import 'package:arwa_s_application1/providers/brand_provider.dart';
import 'package:arwa_s_application1/providers/city_provider.dart';
import 'package:arwa_s_application1/providers/watch_models_provider.dart';
import 'package:arwa_s_application1/validaters.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_subtitle.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_title.dart';
import 'package:arwa_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:arwa_s_application1/widgets/customDropDownwidget.dart';
import 'package:arwa_s_application1/widgets/custom_drop_down.dart';
import 'package:arwa_s_application1/widgets/custom_outlined_button.dart';
import 'package:arwa_s_application1/widgets/custom_text_form_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

// ignore_for_file: must_be_immutable
class Iphone13MiniThirtythreeScreen extends StatefulWidget {
  Iphone13MiniThirtythreeScreen({Key? key}) : super(key: key);

  @override
  State<Iphone13MiniThirtythreeScreen> createState() =>
      _Iphone13MiniThirtythreeScreenState();
}

class _Iphone13MiniThirtythreeScreenState
    extends State<Iphone13MiniThirtythreeScreen> {
  TextEditingController editText1Controller = TextEditingController();

  TextEditingController editText2Controller = TextEditingController();

  TextEditingController refrenceNumber = TextEditingController();

  TextEditingController serialNumber = TextEditingController();

  Map<String, int> brandMap = {};

  Map<String, int> cityMap = {};

  Map<String, int> watchModelMap = {};

  List<String> conditions = [
    "New",
  ];

  List<String> colors = [
    "black",
    "white",
  ];

  int? selectedBrand;

  String? selectedBrandName;

  String? selectedCityName;

  int? selectedCityId;

  int? selectedModel;

  String? selectedCondition;

  String? selectedColor;

  final controller = MultiImagePickerController(
    maxImages: 8,
    withReadStream: true,
    allowedImageTypes: ['png', 'jpg', 'jpeg'],
  );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final brands = ref.watch(brandProvider);
      final cities = ref.watch(cityProvider);

      final watchModels = ref.watch(watchModelsProvider);

      return SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: _buildAppBar(context),
              body: SizedBox(
                  width: double.maxFinite,
                  child: Form(
                    key: _formKey,
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
                                        _buildGroup(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 17.h),
                                            child: Text("Brand:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        CustomDropdownWidget(
                                          hintText: 'Brand',
                                          items: [
                                            ...?brands.when(
                                              data: (data) {
                                                brandMap
                                                    .clear(); // Clear the map before populating it
                                                return data
                                                    .where((brand) =>
                                                        brand.name.isNotEmpty)
                                                    .map((brand) {
                                                  brandMap[brand.name] = brand
                                                      .id; // Store the brand name and ID
                                                  return brand.name;
                                                }).toList();
                                              },
                                              loading: () => [],
                                              error: (error, stackTrace) => [],
                                            ),
                                          ],
                                          onChanged: (dynamic selectedValue) {
                                            int selectedBrandId =
                                                brandMap[selectedValue]!;

                                            String selectedBrandName1 =
                                                selectedValue;
                                            selectedBrand = selectedBrandId;
                                            selectedBrandName =
                                                selectedBrandName1;
                                          },
                                        ),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 17.h),
                                            child: Text("Model:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        CustomDropdownWidget(
                                          hintText: 'Watch Model',
                                          items: [
                                            ...?watchModels.when(
                                              data: (data) {
                                                watchModelMap
                                                    .clear(); // Clear the map before populating it
                                                return data
                                                    .where((model) =>
                                                        model.name.isNotEmpty)
                                                    .map((model) {
                                                  watchModelMap[
                                                      model
                                                          .name] = model
                                                      .id; // Store the model name and ID
                                                  return model.name;
                                                }).toList();
                                              },
                                              loading: () => [],
                                              error: (error, stackTrace) => [],
                                            ),
                                          ],
                                          onChanged: (dynamic selectedValue) {
                                            int selectedWatchModelId =
                                                watchModelMap[selectedValue]!;
                                            selectedModel =
                                                selectedWatchModelId;
                                            print(selectedModel);
                                          },
                                        ),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 17.h),
                                            child: Text("Reference Number:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildThirteen(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 17.h),
                                            child: Text("Condition*",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildSeventeen(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 17.h),
                                            child: Text("Serial Number",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildTwenty(context),
                                        SizedBox(height: 15.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 17.h),
                                            child: Text("Color:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        _buildTwentyFour(context),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 17.h),
                                            child: Text("City:",
                                                style: theme
                                                    .textTheme.titleLarge)),
                                        SizedBox(height: 8.v),
                                        CustomDropdownWidget(
                                          hintText: 'City',
                                          items: [
                                            ...?cities.when(
                                              data: (data) {
                                                cityMap
                                                    .clear(); // Clear the map before populating it
                                                return data
                                                    .where((city) =>
                                                        city.name.isNotEmpty)
                                                    .map((city) {
                                                  cityMap[city.name] = city
                                                      .id; // Store the brand name and ID
                                                  return city.name;
                                                }).toList();
                                              },
                                              loading: () => [],
                                              error: (error, stackTrace) => [],
                                            ),
                                          ],
                                          onChanged: (dynamic selectedValue) {
                                            int cityId =
                                                cityMap[selectedValue]!;

                                            String cityName = selectedValue;
                                            selectedCityId = cityId;

                                            selectedCityName = cityName;
                                          },
                                        ),
                                      ]))))
                    ]),
                  )),
              bottomNavigationBar: _buildNextButton(context)));
    });
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

  Widget _buildGroup(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 21.v),
        child: DottedBorder(
          color: appTheme.black90001,
          padding:
              EdgeInsets.only(left: 1.h, top: 1.v, right: 1.h, bottom: 1.v),
          strokeWidth: 1.h,
          dashPattern: [2, 2],
          child: MultiImagePickerView(
            onChange: (list) {
              setState(() {
                selectedImages = list.map((asset) => asset.name).toList();
              });
              print('Selected Images:');
              debugPrint(selectedImages.toString());
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5, mainAxisSpacing: 5, crossAxisSpacing: 5),
            controller: controller,
            addButtonTitle: 'Add Watch Images',
          ),
        ));
  }

  Widget _buildFour(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),

              //   _buildEditText1(context)
            ]));
  }

  /// Section Widget
  Widget _buildEditText2(BuildContext context) {
    return CustomTextFormField(
      controller: editText2Controller,
      validator: (value) => validateField(value),
    );
  }

  /// Section Widget
  Widget _buildTwo(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 3.v), _buildEditText2(context)]));
  }

  /// Section Widget
  Widget _buildEditText3(BuildContext context) {
    return CustomTextFormField(
      controller: refrenceNumber,
      validator: (value) => validateField(value),
    );
  }

  /// Section Widget
  Widget _buildThirteen(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 3.v), _buildEditText3(context)]));
  }

  /// Section Widget
  Widget _buildSeventeen(BuildContext context) {
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
                  items: conditions,
                  onChanged: (value) {
                    selectedCondition = value;
                  })
            ]));
  }

  /// Section Widget
  Widget _buildEditText4(BuildContext context) {
    return CustomTextFormField(
      controller: serialNumber,
      textInputAction: TextInputAction.done,
      validator: (value) => validateField(value),
    );
  }

  /// Section Widget
  Widget _buildTwenty(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 17.v),
        decoration: AppDecoration.outlinePrimary,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 3.v), _buildEditText4(context)]));
  }

  /// Section Widget
  Widget _buildTwentyFour(BuildContext context) {
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
                  items: colors,
                  onChanged: (value) {
                    selectedColor = value;
                  })
            ]));
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "Next",
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 43.v),
        onPressed: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (C) => Iphone13MiniThirtyfourScreen()));
          onTapNextButton(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the iphone13MiniThirtyfourScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      print(selectedImages);
      print('ggggggg');
      Watch watchModel = Watch(
        brandId: selectedBrand,
        watchModelId: selectedModel,
        referenceNumber: refrenceNumber.text,
        serialNumber: serialNumber.text,
        condition: selectedCondition,
        brandName: selectedBrandName,
        cityName: selectedCityName,
        cityId: selectedCityId,
        color: selectedColor,
        // images: 'hhh',
      );
      print('Arguments before navigation: $watchModel');
      print(selectedBrand);
      print(watchModel.brandId);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Iphone13MiniThirtyfourScreen(
                  watch: watchModel,
                )),
      );
      // Navigator.pushNamed(context, AppRoutes.iphone13MiniThirtyfourScreen,
      //     arguments: watchModel);
    }
  }
}
