import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button.dart';
import 'package:fixify_admin/widgets/text_fields/custom_text_field.dart';
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

  static bannerImages (BuildContext context, {required List<String> images}){
    showModalBottomSheet(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radius4 * 2)),
        context: context,
        builder: (_) {
          return Padding(
            padding:  EdgeInsets.only(left: Dimensions.padding15, right: Dimensions.padding15, bottom: Dimensions.padding15*2),
            child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index){

            })
          );
        });
  }
}
