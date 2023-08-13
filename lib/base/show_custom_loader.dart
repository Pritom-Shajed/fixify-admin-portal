import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget showCustomLoader({Color? color}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitSpinningLines(
          color: color ?? AppColors.primaryColor,
          size: Dimensions.width10 * 5,
        ),
        SizedBox(height: Dimensions.height10,),
        DefaultTextStyle(
          style: TextStyle(
              fontSize: Dimensions.font12,
              color: color ?? AppColors.primaryColor
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText('FIXIFY',),
            ],
          ),
        )
        // SizedBox(
        //   height: Dimensions.height10,
        // ),
        // SmallText(text: 'Loading...', color: color ?? AppColors.blackColor,),
      ],
    ),
  );
}
