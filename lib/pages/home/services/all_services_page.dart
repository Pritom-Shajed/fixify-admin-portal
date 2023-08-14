import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/data/controller/services_controller.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/home/services_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllServicesPage extends StatelessWidget {
  const AllServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allServices = Get.find<HomeController>().allServices;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading:
            CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 * 1),
        child: Column(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SizedBox(
                    width: Dimensions.screenWidth / 3,
                    child: CustomButton2(
                        text: 'Add New',
                        onTap: () {
                          Get.find<ServicesController>()
                              .clearIncludedTextController()
                              .whenComplete(() => Get.find<ServicesController>()
                                  .addNewIncludedTextController()
                                  .whenComplete(() => Get.toNamed(
                                      RouteHelper.getAddServicePage())));
                        }))),
            SizedBox(
              height: Dimensions.height10,
            ),
            ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                      height: Dimensions.height10,
                    ),
                itemCount: allServices.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = allServices[index];
                  return ServicesCard(
                      onTap: () => Get.toNamed(
                          RouteHelper.getSubServicePage(uid: data.uid!)),
                      iconUrl: data.icon!,
                      name: data.name!);
                })
          ],
        ),
      ),
    );
  }
}
