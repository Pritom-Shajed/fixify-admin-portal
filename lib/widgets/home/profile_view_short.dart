import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class ProfileViewShort extends StatelessWidget {
  final String profilePicUrl;
  final String name;
  final String greetingsText;
  final VoidCallback onTapSingOut;

  const ProfileViewShort({
    Key? key,
    required this.profilePicUrl,
    required this.greetingsText,
    required this.name, required this.onTapSingOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(Dimensions.radius12),
        color: AppColors.mainBgColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CachedNetworkImage(
              imageUrl: profilePicUrl,
              imageBuilder: (context, imageProvider) => Container(
                    height: Dimensions.height20 * 3,
                    width: Dimensions.height20 * 3,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius4 * 3),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
              placeholder: (context, url) => ShimmerWidgetContainer(
                  height: Dimensions.height20 * 3,
                  width: Dimensions.height20 * 3)),
          SizedBox(
            width: Dimensions.width10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(
                  text: 'Hi $name!',
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.font14,
                ),
                SizedBox(
                  height: Dimensions.height5,
                ),
                 SmallText(
                  text: greetingsText,
                ),
              ],
            ),
          ),
          CustomButton2(text: 'Sign Out', onTap: onTapSingOut)
        ],
      ),
    );
  }
}
