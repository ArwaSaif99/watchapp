import 'package:arwa_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SuccessDialog extends StatelessWidget {
  const SuccessDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.h,
      padding: EdgeInsets.symmetric(
        horizontal: 143.h,
        vertical: 38.v,
      ),
      decoration: AppDecoration.fillBlack90001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: CustomImageView(
        imagePath: ImageConstant.imgCheckmark,
        height: 56.adaptSize,
        width: 56.adaptSize,
        alignment: Alignment.center,
      ),
    );
  }
}
