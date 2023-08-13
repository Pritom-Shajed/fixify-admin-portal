import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  final String iconUrl;
  final String name;
  final VoidCallback onTap;

  const ServicesCard(
      {Key? key,
        required this.iconUrl,
        required this.name,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.padding10),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
              imageUrl: iconUrl,
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
            child: SmallText(
              textAlign: TextAlign.start,
              text: name,
              fontWeight: FontWeight.w500,
              fontSize: Dimensions.font14,
            ),
          ),
          CustomIconButton(icon: Icons.arrow_forward_ios, onTap: onTap)
        ],
      ),
    );
  }
}
