import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';

class ImagePickerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final ImageProvider? imageProvider;
  final double? width;
  final double? height;
  final bool isBanner;

  const ImagePickerButton({super.key,
    this.isBanner = false,
    required this.onPressed,
    required this.buttonText,
    this.imageProvider, this.width, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return !isBanner ? Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: width ?? Dimensions.height10 * 5,
            height: height ?? Dimensions.height10 * 5,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyColor, width: 1),
              borderRadius: BorderRadius.circular(Dimensions.radius4),
              image: imageProvider != null
                  ? DecorationImage(image: imageProvider!)
                  : null,
            ),
            child: const Icon(Icons.add),
          ),
        ),
        SizedBox(
          width: Dimensions.width10,
        ),
        SmallText(text: buttonText),
      ],
    ) : Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            width: width ?? double.maxFinite,
            height: height ?? Dimensions.height20 * 10,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.primaryColorLight, width: 1),
              borderRadius: BorderRadius.circular(Dimensions.radius4),
              image: imageProvider != null
                  ? DecorationImage(image: imageProvider!, fit: BoxFit.cover)
                  : null,
            ),
            child: imageProvider == null ?  const Icon(Icons.add) :  null,
          ),
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        SmallText(text: buttonText, fontSize: Dimensions.font14,),
      ],
    );
  }
}
