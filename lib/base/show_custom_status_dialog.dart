import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

showCustomStatusDialog (BuildContext context, {
  required String status,
  String? subtitleText,
  Color? titleTextColor,
  required VoidCallback onTap,
  bool isNoButtonEnabled = true,
}){
  showDialog(context: context, builder: (context){
    return SimpleDialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius12)),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: Dimensions.padding15 * 2,
        horizontal: Dimensions.padding15,
      ),
      children: [
        Column(
          children: [
            RichText(text: TextSpan(
              text: 'Status: ',
              style: TextStyle(
                fontSize: Dimensions.font16,
                color: AppColors.blackColor,
              ),
              children: [
                TextSpan(
                  text: status,
                  style: TextStyle(
                    fontSize: Dimensions.font16,
                    color: status == 'Inactive' ? AppColors.middleColor : AppColors.positiveColor,
                  )
                )
              ]
            )),
            subtitleText == null ? Container(): SizedBox(
              height: Dimensions.height10,
            ),
            subtitleText == null ? Container(): Center(
                child: MediumText(
                  textAlign: TextAlign.center,
                  text: subtitleText,
                  fontSize: Dimensions.font14,
                  color:  status == 'Inactive' ? AppColors.positiveColor : AppColors.negativeColor ,
                )),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(Dimensions.padding15),
          child: CustomButton(
              textColor: AppColors.primaryColor,
              color: AppColors.primaryColorLight.withOpacity(0.3),
              onTap: onTap,
              text: status == 'Inactive' ? 'Activate' : 'Deactivate' ),
        )
      ],
    );
  });
}