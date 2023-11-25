import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomDropdownFields {
  static Widget dropdown1<T>({
    required List<T> items,
    required ValueChanged<T?>? onChanged,
    T? value,
  }) =>
      DropdownButton<T>(
        value: value,
        onChanged: onChanged,
        underline: const SizedBox.shrink(),
        isExpanded: true,
        style: const TextStyle(color: Colors.black),
        dropdownColor: AppColors.whiteColor,
        icon:  Icon(Icons.arrow_drop_down_circle_sharp, color: AppColors.primaryColor,),
        selectedItemBuilder: (BuildContext context) {
          return items.map((T value) {
            return Align(
                alignment: Alignment.centerRight,
                child: MediumText(text: value.toString(), color: AppColors.blackColor, fontSize: Dimensions.font14,)
            );
          }).toList();
        },
        items: items.map((T value) {
          return DropdownMenuItem(value: value, child: SmallText(text: value.toString(),));
        }).toList(),
      );

}