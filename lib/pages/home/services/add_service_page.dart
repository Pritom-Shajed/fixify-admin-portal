import 'package:fixify_admin/data/controller/services_controller.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:fixify_admin/widgets/texts/text_with_underline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({Key? key}) : super(key: key);

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  int includeCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          leading:
              CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
          backgroundColor: AppColors.whiteColor,
        ),
        body: GetBuilder<ServicesController>(builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.padding10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: Dimensions.height10 * 5,
                        height: Dimensions.height10 * 5,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.greyColor, width: 1),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius4),
                        ),
                        child: const Icon(Icons.add),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      const SmallText(text: 'Add Icon'),
                    ],
                  ),
                  const CustomTextField(titleText: 'Service Name'),
                  Divider(
                    thickness: 1,
                    height: Dimensions.height20,
                  ),
                  const TextWithUnderline(text: 'Sub Service'),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: Dimensions.height10 * 5,
                        height: Dimensions.height10 * 5,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.greyColor, width: 1),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius4),
                        ),
                        child: const Icon(Icons.add),
                      ),
                      SizedBox(
                        width: Dimensions.width10,
                      ),
                      const SmallText(text: 'Add Picture'),
                    ],
                  ),

                  const CustomTextField(required: false,titleText: 'Name: '),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  const SmallText(text: 'What\'s Included'),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.includedTextController.length,
                      itemBuilder: (context, index) {
                        return CustomTextField(
                          required: false,
                          titleText: '${index + 1} |',
                          controller: controller.includedTextController[index],
                        );
                      }),
                  SizedBox(
                      width: Dimensions.screenWidth / 3,
                      child: CustomButton2(
                          text: 'Add more',
                          onTap: () =>
                              controller.addNewIncludedTextController()))
                ],
              ),
            ),
          );
        }));
  }
}
