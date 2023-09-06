import 'package:fixify_admin/base/show_custom_toast.dart';
import 'package:fixify_admin/data/controller/services_controller.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/buttons/image_picker_btn.dart';
import 'package:fixify_admin/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddSubServicePage extends StatefulWidget {
  final String serviceUid;
  final String serviceName;
  const AddSubServicePage({Key? key, required this.serviceUid, required this.serviceName}) : super(key: key);

  @override
  State<AddSubServicePage> createState() => _AddSubServicePageState();
}

class _AddSubServicePageState extends State<AddSubServicePage> {
  int includeCount = 1;

  late TextEditingController subServiceNameController;

  @override
  void initState() {
    subServiceNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    subServiceNameController.dispose();
    super.dispose();
  }

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
                      ImagePickerButton(
                        onPressed: () => controller.pickPicture(ImageSource.gallery),
                        buttonText: controller.servicePicture != null
                            ? 'Change Picture'
                            : 'Add Picture',
                        imageProvider: controller.servicePicture != null
                            ? FileImage(controller.servicePicture!)
                            : null,
                      ),
                      const Spacer(),
                      CustomButton2(
                          text: 'Submit',
                          onTap: () {
                            if(controller.servicePicture == null){
                              showCustomToast('Add Service Picture');
                            } else if(subServiceNameController.text == '' || subServiceNameController.text.isEmpty){
                              showCustomToast('Add Sub-Service Name');
                            } else if(controller.includedTextController.map((controller) => controller.text).contains('')){
                              showCustomToast('Fill Whats Included');
                            } else {
                              controller.addSubService(widget.serviceName, widget.serviceUid, subServiceNameController.text);
                            }
                          }),
                    ],
                  ),

                  CustomTextField(
                    required: false,
                    titleText: 'Name: ',
                    controller: subServiceNameController,
                  ),
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
                  SizedBox(height: Dimensions.height10,),
                  Row(
                    children: [
                      Expanded(
                          child: CustomButton2(
                              text: 'Add more',
                              onTap: () =>
                                  controller.addNewIncludedTextController())),
                      SizedBox(width: Dimensions.width10,),
                      controller.includedTextController.length > 1 ? Expanded(
                          child: CustomButton2(
                              text: 'Remove last',
                              onTap: () =>
                                  controller.removeIncludedTextController())) : const SizedBox()
                    ],
                  ),

                  SizedBox(height: Dimensions.height10*3,),
                ],
              ),
            ),
          );
        }));
  }
}
