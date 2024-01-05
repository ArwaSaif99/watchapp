import 'package:arwa_s_application1/presentation/brands_screen.dart';
import 'package:arwa_s_application1/presentation/iphone_13_mini_thirtythree_screen/iphone_13_mini_thirtythree_screen.dart';
import 'package:arwa_s_application1/presentation/meneu_screen/meneu_screen.dart';

import '../home_page/widgets/rolexcomponent_item_widget.dart';
import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_leading_image.dart';
import 'package:arwa_s_application1/widgets/app_bar/appbar_trailing_image.dart';
import 'package:arwa_s_application1/widgets/app_bar/custom_app_bar.dart';
import 'package:arwa_s_application1/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: _scaffoldKey,
            appBar: _buildAppBar(context),
            drawer: Drawer(
              child: MeneuScreen(),
            ),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 13.h),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(height: 16.v),
                    _buildEightyNine(context),
                    SizedBox(height: 16.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 3.h),
                            child: Text("Brands",
                                style:
                                    CustomTextStyles.bodyLargeBlack90001_1))),
                    SizedBox(height: 7.v),
                    Divider(
                        color: theme.colorScheme.errorContainer,
                        indent: 6.h,
                        endIndent: 3.h),
                    SizedBox(height: 9.v),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: BrandsScreen())
                  ]),
                ))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgMenu,
            margin: EdgeInsets.only(left: 16.h, top: 12.v, bottom: 8.v),
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            }),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgCart,
              margin: EdgeInsets.fromLTRB(16.h, 14.v, 8.h, 2.v)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgBell,
              margin: EdgeInsets.only(left: 12.h, top: 12.v, right: 24.h))
        ],
        styleType: Style.bgFill_1);
  }

  /// Section Widget
  Widget _buildEightyNine(BuildContext context) {
    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.h),
          child: CustomSearchView(
            controller: searchController,
            hintText: "Search",
            autofocus: false,
          )),
      SizedBox(height: 8.v),
      CustomImageView(
          imagePath: ImageConstant.imgRectangle4069,
          height: 136.v,
          width: 349.h,
          radius: BorderRadius.circular(10.h))
    ]);
  }

  onTapMenu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.meneuScreen);
  }

  /// Section Widget
}
