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

  const ImagePickerButton({super.key,
    required this.onPressed,
    required this.buttonText,
    this.imageProvider, this.width, this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
