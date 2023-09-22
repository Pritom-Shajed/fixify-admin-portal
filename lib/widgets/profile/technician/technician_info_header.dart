import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button.dart';
import 'package:fixify_admin/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';

class TechnicianInfoHeader extends StatelessWidget {
  final String fullName;
  final String nickName;
  final String division;
  final String area;
  final String profilePicUrl;
  final VoidCallback onTapStatus;
  final String status;
  const TechnicianInfoHeader({Key? key, required this.fullName, required this.area, required this.profilePicUrl, required this.division, required this.nickName, required this.onTapStatus, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(Dimensions.padding10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            Dimensions.radius4 * 2),
        color: AppColors.primaryColor.withOpacity(0.05),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
              imageUrl: profilePicUrl,
              imageBuilder: (context, imageProvider) => Container(
                padding: EdgeInsets.all(Dimensions.padding5/5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        Dimensions.radius4 * 3),
                    border: Border.all(color: AppColors.primaryColorLight, width: 1.5)
                ),
                child: Container(
                  height: Dimensions.height20 * 4,
                  width: Dimensions.height20 * 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Dimensions.radius4 * 3),
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover)),
                ),
              ),
              placeholder: (context, url) =>
                  ShimmerWidgetContainer(
                      height: Dimensions.height20 * 4,
                      width: Dimensions.height20 * 4)),
          SizedBox(width: Dimensions.width10,),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText(
                  textAlign: TextAlign.start,
                  text: fullName,
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.font16,
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                RichText(
                    text: TextSpan(
                        text: '$division | ',
                        style: TextStyle(color: AppColors.primaryColor, fontSize: Dimensions.font12),
                        children: [
                          TextSpan(text: area)
                        ])),

                SizedBox(
                  height: Dimensions.height5,
                ),
                CustomButton(
                    text: status, onTap: onTapStatus ,color: status == 'Inactive' ? AppColors.middleColor : AppColors.positiveColor,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
