import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const BannerCard(
      {Key? key,
        required this.name,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding10),
      margin: EdgeInsets.symmetric(horizontal: Dimensions.margin10),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius4 * 3),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 5),
                color: AppColors.shadowColor),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const SmallText(
                  textAlign: TextAlign.start,
                  text: 'Type',
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Divider(
                    color: AppColors.primaryColor,
                    height: Dimensions.height10,
                  ),
                ),
                SmallText(
                  textAlign: TextAlign.start,
                  text: name,
                  fontWeight: FontWeight.w500,
                ),
              ],
            )
          ),
          SizedBox(width: Dimensions.width10,),
          CustomIconButton(icon: Icons.remove_red_eye, onTap: onTap)
        ],
      ),
    );
  }
}
