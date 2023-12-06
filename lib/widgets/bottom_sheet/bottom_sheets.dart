import 'package:cached_network_image/cached_network_image.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/shimmer_effect/container_shimmer_widget.dart';
import 'package:fixify_admin/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class BottomSheets {
  static bannerAddType(BuildContext context, {required TextEditingController textController, required VoidCallback onTapAdd}) {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius4 * 2)),
        context: context,
        builder: (_) {
          return Padding(
            padding:  EdgeInsets.only(left: Dimensions.padding15, right: Dimensions.padding15, bottom: Dimensions.padding15*2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: Dimensions.width150,
                  child: Image.asset('assets/icons/fixify_logo.png'),
                ),
                CustomTextField(
                  controller: textController,
                  titleText: 'Banner Type',
                  hintText: 'Enter banner type',
                  fillColor: AppColors.primaryColorLight.withOpacity(0.2),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width/2,
                    child: CustomButton(text: 'Add', onTap: onTapAdd))
              ],
            ),
          );
        });
  }

  static bannerImages (BuildContext context, {required List<String> images, required VoidCallback onTapAddNew, required String bannerType}){
    showModalBottomSheet(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius4 * 2)),
        context: context,
        builder: (_) {
          return Padding(
            padding:  EdgeInsets.all(Dimensions.padding15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MediumText(text: bannerType, fontWeight: FontWeight.bold,),
                SizedBox(height: Dimensions.height15,),
                images.isNotEmpty ? const SizedBox.shrink() : const SmallText(text: 'No banners added yet',),
                images.isNotEmpty ? Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: Dimensions.height10,),
                      itemCount: images.length,
                      itemBuilder: (context, index){
                        return  CachedNetworkImage(
                            imageUrl: images[index],
                            imageBuilder: (context, imageProvider) => Container(
                              height: Dimensions.height20 * 10,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(Dimensions.radius4 * 3),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                            placeholder: (context, url) => ShimmerWidgetContainer(
                                height: Dimensions.height20 * 10,
                                width: double.maxFinite));
                  }),
                ) : const SizedBox.shrink(),
                SizedBox(height: Dimensions.height15,),
                CustomButton2(text: 'Add New', onTap: onTapAddNew)
              ],
            )
          );
        });
  }
}
