import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/texts/large_text.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class ShowInfoContainer extends StatelessWidget {
  final String number;
  final String title;
  final double? fontSizeTitle;
  final String? subtitle;
  final VoidCallback? onTap;

  const ShowInfoContainer(
      {Key? key,
      required this.number,
      required this.title,
      this.fontSizeTitle,
      this.subtitle,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: Dimensions.workInfoContainerWidth,
        height: Dimensions.workInfoContainerHeight,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius4 * 2),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                  color: AppColors.shadowColor),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MediumText(
              text: title,
            ),
            SizedBox(
              height: Dimensions.height5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LargeText(
                  text: number,
                  fontSize: fontSizeTitle ?? Dimensions.font50,
                ),
                subtitle == null ? Container() : SmallText(text: subtitle!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
