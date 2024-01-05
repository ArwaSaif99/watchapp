import 'package:arwa_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RolexcomponentItemWidget extends StatelessWidget {
  final String name;
  final String picture;

  RolexcomponentItemWidget({
    required this.name,
    required this.picture,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.v,
      width: 166.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: picture, // Use the picture parameter
            height: 200.v,
            width: 166.h,
            fit: BoxFit.cover,
            radius: BorderRadius.circular(10.h),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 47.h,
                vertical: 78.v,
              ),
              decoration: AppDecoration.fillBlack900011.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Text(
                name, // Use the name parameter
                style: theme.textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
