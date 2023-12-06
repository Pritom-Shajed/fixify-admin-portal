import 'package:fixify_admin/base/show_custom_toast.dart';
import 'package:fixify_admin/data/controller/banner_controller.dart';
import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/bottom_sheet/bottom_sheets.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/home/banner_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBannersPage extends StatefulWidget {
  const AllBannersPage({Key? key}) : super(key: key);

  @override
  State<AllBannersPage> createState() => _AllBannersPageState();
}

class _AllBannersPageState extends State<AllBannersPage> {
  late TextEditingController bannerTypeController;

  @override
  void initState() {
    bannerTypeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    bannerTypeController.dispose();
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
      body: GetBuilder<BannerController>(builder: (controller) {
        final allBanners = Get.find<HomeController>().allBanners;
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 * 1),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width/2.5,
                    child: CustomButton2(
                        text: 'Add New Type',
                        onTap: () {
                          BottomSheets.bannerAddType(context,
                              textController: bannerTypeController,
                              onTapAdd: () {
                                if (bannerTypeController.text.isEmpty) {
                                  showCustomToast('Banner type can\'t be empty');
                                } else {
                                  controller.addBannerType(
                                      bannerType:
                                      bannerTypeController.text.trim());
                                }
                              });
                        }),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                Expanded(
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => SizedBox(
                            height: Dimensions.height10,
                          ),
                      itemCount: allBanners.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var data = allBanners[index];
                        return BannerCard(
                            name: data.bannerType ?? 'null',
                            onTap: () {
                              BottomSheets.bannerImages(context,
                                  onTapAddNew: () {
                                Get.back();
                                Get.toNamed(
                                    RouteHelper.getAddBannerPage(bannerTypeUid: data.uid ?? ''));
                                  },
                                  bannerType: data.bannerType ?? 'null',
                                  images: data.bannerList
                                          ?.map((e) => e.bannerUrl ?? '')
                                          .toList() ??
                                      []);
                            });
                      }),
                ),
              ],
            ));
      }),
    );
  }
}
