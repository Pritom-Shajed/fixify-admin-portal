import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;
  final VoidCallback onTap;

  const CustomerCard(
      {Key? key,
        required this.imageUrl,
        required this.name,
        required this.email,
        required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
                imageUrl: imageUrl,
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
                    textAlign: TextAlign.start,
                    text: name,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: Dimensions.height10,),
                  SmallText(
                    textAlign: TextAlign.start,
                    text: email,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SizedBox(width: Dimensions.width10,),
            CustomIconButton(icon: Icons.arrow_forward_ios, onTap: onTap)
          ],
        ),
      ),
    );
  }
}
