import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class AppointmentStatusText extends StatelessWidget {
  final String status;
  final double? fontSize;
  final double? iconSize;
  final double? outerRadiusSize;
  const AppointmentStatusText({Key? key, required this.status, this.fontSize, this.iconSize, this.outerRadiusSize, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: MediumText(
              fontWeight: FontWeight.w600,
              text: status.toUpperCase(),
              fontSize: fontSize,
              color: (() {
                if (status == 'on progress') {
                  return AppColors.primaryColor;
                } else if(status == 'confirmed') {
                  return AppColors.positiveColor;
                } else {
                  return AppColors.negativeColor;
                }
              }()),
            )),
        SizedBox(
          width: Dimensions.width10 / 2,
        ),
        ((){
          if (status == 'on progress') {
            return CircleAvatar(
              radius: outerRadiusSize ?? Dimensions.radius12*0.8,
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                  Icons.access_time_outlined,
                  size: iconSize ?? Dimensions.icon15,
                  color: AppColors.whiteColor
              ),
            );
          } else if(status == 'confirmed') {
            return CircleAvatar(
              radius:outerRadiusSize ??  Dimensions.radius12*0.8,
              backgroundColor: AppColors.positiveColor,
              child: Icon(
                  Icons.check,
                  size: iconSize ?? Dimensions.icon15,
                  color: AppColors.whiteColor
              ),
            );
          } else {
            return CircleAvatar(
              radius:outerRadiusSize ?? Dimensions.radius12*0.8,
              backgroundColor: AppColors.negativeColor,
              child: Icon(
                Icons.close_rounded,
                size:  iconSize ?? Dimensions.icon15,
                color: AppColors.whiteColor,
              ),
            );
          }
        }()),
      ],
    );
  }
}
