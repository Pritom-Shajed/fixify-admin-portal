import 'package:fixify_admin/base/show_custom_loader.dart';
import 'package:fixify_admin/base/show_custom_snackbar.dart';
import 'package:fixify_admin/base/show_custom_toast.dart';
import 'package:fixify_admin/data/controller/banner_controller.dart';
import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/buttons/image_picker_btn.dart';
import 'package:fixify_admin/widgets/common/info_dropdown_text.dart';
import 'package:fixify_admin/widgets/dropdown_fields/custom_dropdown_fields.dart';
import 'package:fixify_admin/widgets/profile/user_info_text.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddBannerPage extends StatefulWidget {
  final String bannerTypeUid;
  const AddBannerPage({Key? key, required this.bannerTypeUid}) : super(key: key);

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





  @override
  Widget build(BuildContext context) {
    final bannerInfo = Get
        .find<HomeController>()
        .allBanners.where((banner) => banner.uid == widget.bannerTypeUid).singleOrNull;
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          leading:
          CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
          backgroundColor: AppColors.whiteColor,
        ),
        body:bannerInfo == null ? const Center(child: SmallText(text: 'No Data Found!'),) : GetBuilder<BannerController>(builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.padding10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInfoText(
                    text1: 'Banner Type',
                    text2: bannerInfo.bannerType ?? 'null',
                    fontSize: Dimensions.font14,
                    text2color: AppColors.blackColor,
                  ),
                  ImagePickerButton(
                    isBanner: true,
                    onPressed: () =>
                        controller.pickBanner(ImageSource.gallery),
                    buttonText: controller.bannerPicture != null
                        ? 'Change Banner'
                        : 'Add Banner',
                    imageProvider: controller.bannerPicture != null
                        ? FileImage(controller.bannerPicture!)
                        : null,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  CustomButton2(text: 'Add', onTap: () {
                    controller.addBanner(bannerTypeUid: bannerInfo.uid ?? 'null');
                  }),
                ],
              ),
            ),
          );
        }));
  }
}
