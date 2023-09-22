import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class TechnicianCard extends StatelessWidget {
  final String status;
  final String imageUrl;
  final String time;
  final String name;
  final String location;
  final String? services;
  final VoidCallback? onTap;

  const TechnicianCard(
      {Key? key,
      required this.status,
      required this.imageUrl,
      required this.time,
      required this.name,
      required this.location,
      this.services,
      this.onTap})
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SmallText(
              text: status,
              fontWeight: FontWeight.bold,
              color: status == 'Inactive'
                  ? AppColors.middleColor
                  : AppColors.positiveColor,
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            Row(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  size: Dimensions.icon15,
                                  color: AppColors.primaryColor,
                                ),
                                Expanded(
                                  child: SmallText(
                                    textAlign: TextAlign.start,
                                    text: time,
                                    fontSize: Dimensions.font16 * 0.6,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                size: Dimensions.icon15,
                                color: AppColors.primaryColor,
                              ),
                              SmallText(
                                text: location,
                                fontSize: Dimensions.font16 * 0.6,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      SmallText(
                        textAlign: TextAlign.start,
                        text: name,
                        fontWeight: FontWeight.w500,
                      ),
                      services != null
                          ? RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: 'Services: ',
                                  style: TextStyle(
                                      color: AppColors.greyColor,
                                      fontSize: Dimensions.font16 * 0.65),
                                  children: [TextSpan(text: services)]))
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
