import 'package:fixify_admin/base/show_custom_loader.dart';
import 'package:fixify_admin/base/show_custom_snackbar.dart';
import 'package:fixify_admin/base/show_custom_toast.dart';
import 'package:fixify_admin/data/controller/banner_controller.dart';
import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/data/controller/services_controller.dart';
import 'package:fixify_admin/model/banner_model.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/bottom_sheet/bottom_sheets.dart';
import 'package:fixify_admin/widgets/buttons/custom_button.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/buttons/image_picker_btn.dart';
import 'package:fixify_admin/widgets/common/info_dropdown_text.dart';
import 'package:fixify_admin/widgets/dropdown_fields/custom_dropdown_fields.dart';
import 'package:fixify_admin/widgets/profile/user_info_text.dart';
import 'package:fixify_admin/widgets/text_fields/custom_text_field.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:fixify_admin/widgets/texts/text_with_underline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddBannerPage extends StatefulWidget {
  const AddBannerPage({Key? key}) : super(key: key);

  @override
  State<AddBannerPage> createState() => _AddBannerPageState();
}

class _AddBannerPageState extends State<AddBannerPage> {
  int includeCount = 1;

  late TextEditingController serviceNameController;
  late TextEditingController subServiceNameController;
  late TextEditingController bannerTypeController;

  @override
  void initState() {
    serviceNameController = TextEditingController();
    subServiceNameController = TextEditingController();
    bannerTypeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    serviceNameController.dispose();
    subServiceNameController.dispose();
    bannerTypeController.dispose();
    super.dispose();
  }


  final bannerList = Get
      .find<HomeController>()
      .allBanners;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          leading:
          CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
          backgroundColor: AppColors.whiteColor,
        ),
        body: GetBuilder<BannerController>(builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.padding10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                          width: Dimensions.screenWidth / 3,
                          child: CustomButton2(
                              text: 'Add New Type',
                              onTap: () {
                                BottomSheets.bannerAddType(context,
                                    textController: bannerTypeController,
                                    onTapAdd: (){
                                  if(bannerTypeController.text.isEmpty){
                                    showCustomToast('Banner type can\'t be empty');
                                  }else {
                                    controller.addBannerType(bannerType: bannerTypeController.text.trim());
                                  }

                                    });
                              }))),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  InfoDropdownText(
                    text: 'Banner Type',
                    dropdownButton: CustomDropdownFields.dropdown1(
                        value: controller.selectedBannerCategory,
                        items: bannerList.map((e) => e.bannerType).toList(),
                        onChanged: (banner) {
                          controller.updateSelectedBannerCategory(banner
                              .toString());
                        }),
                  ),
                  ImagePickerButton(
                    isBanner: true,
                    onPressed: () =>
                        controller.pickBanner(ImageSource.camera),
                    buttonText: controller.bannerPicture != null
                        ? 'Change Banner'
                        : 'Add Banner',
                    imageProvider: controller.bannerPicture != null
                        ? FileImage(controller.bannerPicture!)
                        : null,
                  ),
                  SizedBox(
                    height: Dimensions.height20 * 2,
                  ),
                  CustomButton2(text: 'Submit', onTap: () {
                    controller.addBanner(bannerTypeUid: bannerList
                        .where((banner) =>
                    banner.bannerType == controller.selectedBannerCategory)
                        .singleOrNull
                        ?.uid ?? '');
                  }),
                ],
              ),
            ),
          );
        }));
  }
}
