import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/dropdown_fields/custom_dropdown_fields.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class InfoDropdownText extends StatelessWidget {
  final String text;
  final BorderSide? borderSide;
  final double? fontSize;
  final Widget dropdownButton;

   const InfoDropdownText(
      {super.key,
        required this.text,
        this.borderSide,
        this.fontSize,  required this.dropdownButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Dimensions.padding15),
      margin: EdgeInsets.only(bottom: Dimensions.padding15),
      decoration: BoxDecoration(
          border: Border(
              bottom: borderSide ??
                  BorderSide(color: AppColors.greyColor.withOpacity(0.1)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MediumText(
                      text: text,
                      textAlign: TextAlign.start,
                      fontSize: fontSize ?? Dimensions.font14,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  MediumText(
                    text: ':',
                    textAlign: TextAlign.start,
                    fontSize: fontSize ?? Dimensions.font14,
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: dropdownButton),
        ],
      ),
    );
  }
}
