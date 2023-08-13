import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:flutter/material.dart';

class TextWithUnderline extends StatelessWidget {
  final String text;
  final double? fontSize;
  const TextWithUnderline({Key? key, required this.text, this.fontSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 2.0),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.greyColor)),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: fontSize ?? Dimensions.font12),
        ));
  }
}
