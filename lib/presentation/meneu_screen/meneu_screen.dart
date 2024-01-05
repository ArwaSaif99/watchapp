import 'package:arwa_s_application1/core/app_export.dart';
import 'package:arwa_s_application1/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MeneuScreen extends StatelessWidget {
  const MeneuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final userAsync = ref.watch(userProvider);

        return userAsync.when(
          data: (user) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: theme.colorScheme.primary,
                body: SizedBox(
                  width: 307.h,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: SizeUtils.height,
                      width: 307.h,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 17.v),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 38.v),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 16.h,
                                        right: 58.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                            imagePath: user[0].profileImage,
                                            height: 86.adaptSize,
                                            width: 86.adaptSize,
                                            radius: BorderRadius.circular(
                                              43.h,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 9.v),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Hello",
                                                    style: theme
                                                        .textTheme.displaySmall,
                                                  ),
                                                ),
                                                Text(
                                                  user.isNotEmpty
                                                      ? user[0].name!
                                                      : "Guest",
                                                  style: CustomTextStyles
                                                      .bodyLargeOnErrorContainer,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 14.v),
                                  _buildClientTestimonials(context),
                                  SizedBox(height: 15.v),
                                  _buildReviews(context),
                                  SizedBox(height: 18.v),
                                  _buildDoctorReviews(context),
                                  SizedBox(height: 15.v),
                                  _buildRecentOrders(context),
                                  SizedBox(height: 17.v),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 16.h),
                                      child: Text(
                                        "Security information",
                                        style: CustomTextStyles
                                            .bodyLargeBlack90001_1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 801.v),
                            child: _buildUserProfile(
                              context,
                              locationImage: ImageConstant.imgLocation,
                              changePasswordText: "Change Password",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          loading: () {
            return Container(
                width: 20, height: 20, child: CircularProgressIndicator());
          },
          error: (error, stackTrace) {
            return Text('Error: $error');
          },
        );
      },
    );
  }

  /// Section Widget
  Widget _buildClientTestimonials(BuildContext context) {
    return SizedBox(
      height: 148.v,
      width: 307.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 274.h,
              child: Divider(
                color: appTheme.gray90021,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 14.v,
              ),
              decoration: AppDecoration.fillWhiteA,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 8.v),
                  Padding(
                    padding: EdgeInsets.only(left: 3.h),
                    child: _buildPlaylist(
                      context,
                      archiveSettingsImage: ImageConstant.imgHeartOutline,
                      yourOrdersHistoryText: "Your Wishlist",
                    ),
                  ),
                  SizedBox(height: 7.v),
                  Opacity(
                    opacity: 0.1,
                    child: Divider(
                      indent: 17.h,
                      endIndent: 22.h,
                    ),
                  ),
                  SizedBox(height: 10.v),
                  Padding(
                    padding: EdgeInsets.only(left: 3.h),
                    child: _buildPlaylist(
                      context,
                      archiveSettingsImage:
                          ImageConstant.imgArchiveSettingsOutline,
                      yourOrdersHistoryText: "Your Orders History",
                    ),
                  ),
                  SizedBox(height: 14.v),
                  Opacity(
                    opacity: 0.1,
                    child: Divider(
                      indent: 2.h,
                      endIndent: 5.h,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: _buildEighty(
                      context,
                      dynamicImage: ImageConstant.imgMapMarkerOutline,
                      dynamicText: "YourAddress",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildReviews(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            "Language ",
            style: CustomTextStyles.bodyLargeBlack90001_1,
          ),
        ),
        SizedBox(height: 5.v),
        _buildUserProfile(
          context,
          locationImage: ImageConstant.imgClose,
          changePasswordText: "Switch Language",
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildDoctorReviews(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            "Need Help?",
            style: CustomTextStyles.bodyLargeBlack90001_1,
          ),
        ),
        SizedBox(height: 5.v),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
            vertical: 22.v,
          ),
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 3.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgCall,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                    margin: EdgeInsets.only(bottom: 3.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 21.h),
                    child: Text(
                      "Call Us",
                      style: CustomTextStyles.bodyMediumOnErrorContainer,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 16.v,
                    width: 8.h,
                    margin: EdgeInsets.only(bottom: 3.v),
                  ),
                ],
              ),
              SizedBox(height: 11.v),
              Opacity(
                opacity: 0.1,
                child: Divider(
                  indent: 15.h,
                  endIndent: 21.h,
                ),
              ),
              SizedBox(height: 13.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgVolume,
                    height: 20.v,
                    width: 19.h,
                    margin: EdgeInsets.only(bottom: 2.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 19.h),
                    child: Text(
                      "whatsApp",
                      style: CustomTextStyles.bodyMediumOnErrorContainer,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgArrowRight,
                    height: 16.v,
                    width: 8.h,
                    margin: EdgeInsets.only(bottom: 4.v),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildRecentOrders(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 19.h),
          child: Text(
            "Info",
            style: CustomTextStyles.bodyLargeBlack90001_1,
          ),
        ),
        SizedBox(height: 8.v),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 25.v,
          ),
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 2.h,
                  right: 1.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgInbox,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 19.h),
                      child: Text(
                        "About Us",
                        style: CustomTextStyles.bodyMediumOnErrorContainer,
                      ),
                    ),
                    Spacer(),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowRight,
                      height: 16.v,
                      width: 8.h,
                      margin: EdgeInsets.symmetric(vertical: 2.v),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.v),
              Opacity(
                opacity: 0.1,
                child: Divider(
                  indent: 20.h,
                  endIndent: 20.h,
                ),
              ),
              SizedBox(height: 10.v),
              Padding(
                padding: EdgeInsets.only(right: 1.h),
                child: _buildEighty(
                  context,
                  dynamicImage: ImageConstant.imgDescription,
                  dynamicText: "Privacy & Policy",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildPlaylist(
    BuildContext context, {
    required String archiveSettingsImage,
    required String yourOrdersHistoryText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: archiveSettingsImage,
          height: 24.adaptSize,
          width: 24.adaptSize,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 14.h,
            bottom: 2.v,
          ),
          child: Text(
            yourOrdersHistoryText,
            style: CustomTextStyles.bodyMediumOnErrorContainer.copyWith(
              color: theme.colorScheme.onErrorContainer,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 16.v,
          width: 8.h,
          margin: EdgeInsets.only(bottom: 7.v),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildEighty(
    BuildContext context, {
    required String dynamicImage,
    required String dynamicText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImageView(
          imagePath: dynamicImage,
          height: 25.v,
          width: 24.h,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 17.h,
            top: 2.v,
          ),
          child: Text(
            dynamicText,
            style: CustomTextStyles.bodyMediumOnErrorContainer.copyWith(
              color: theme.colorScheme.onErrorContainer,
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          imagePath: ImageConstant.imgArrowRight,
          height: 16.v,
          width: 8.h,
          margin: EdgeInsets.only(
            top: 4.v,
            bottom: 5.v,
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildUserProfile(
    BuildContext context, {
    required String locationImage,
    required String changePasswordText,
  }) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillWhiteA,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: locationImage,
            height: 20.v,
            width: 22.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 11.h),
            child: Text(
              changePasswordText,
              style: CustomTextStyles.bodyMediumOnErrorContainer.copyWith(
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgArrowRight,
            height: 16.v,
            width: 8.h,
          ),
        ],
      ),
    );
  }
}
