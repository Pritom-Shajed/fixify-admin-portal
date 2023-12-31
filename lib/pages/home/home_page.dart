import 'package:fixify_admin/base/show_custom_loader.dart';
import 'package:fixify_admin/base/show_custom_toast.dart';
import 'package:fixify_admin/data/controller/auth_controller.dart';
import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/greetings/time_greetings.dart';
import 'package:fixify_admin/widgets/home/profile_view_short.dart';
import 'package:fixify_admin/widgets/home/show_info_container.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          title: const Text('Admin Portal'),
        ),
        body: FutureBuilder(
            future: Get.find<HomeController>().loadInitialData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return showCustomLoader();
              } else if (snapshot.hasError) {
                return const Center(child: MediumText(text: 'Oops! Unknown error occurred'));
              } else {
                return GetBuilder<HomeController>(builder: (controller) {
                  return RefreshIndicator(
                    onRefresh: () => controller.loadInitialData(),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.padding10),
                        child: Column(
                          children: [
                            ProfileViewShort(
                              profilePicUrl: controller
                                      .adminInfo?.profilePicUrl ??
                                  'https://www.kindpng.com/picc/m/207-2074624_white-gray-circle-avatar-png-transparent-png.png',
                              name: controller.adminInfo?.name ?? 'null',
                              greetingsText: Greetings.getGreetingsByTime(),
                              onTapSingOut: () =>
                                  Get.find<AuthController>().signOut(),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ShowInfoContainer(
                                        onTap: () => Get.toNamed(
                                            RouteHelper.getAllBannerPage()),
                                        number: controller.allServices.length
                                            .toString(),
                                        title: 'Banners')),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ShowInfoContainer(
                                        onTap: () => Get.toNamed(
                                            RouteHelper.getAllCustomerPage()),
                                        number: controller.allCustomers.length
                                            .toString(),
                                        title: 'Customers')),
                                SizedBox(
                                  width: Dimensions.width10 * 2,
                                ),
                                Expanded(
                                    child: ShowInfoContainer(
                                        onTap: () => Get.toNamed(
                                            RouteHelper.getAllTechnicianPage()),
                                        number: controller.allTechnicians.length
                                            .toString(),
                                        title: 'Technicians')),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ShowInfoContainer(
                                        onTap: () => Get.toNamed(
                                            RouteHelper.getAllServicesPage()),
                                        number: controller.allServices.length
                                            .toString(),
                                        title: 'Services')),
                                SizedBox(
                                  width: Dimensions.width10 * 2,
                                ),
                                Expanded(
                                    child: ShowInfoContainer(
                                        onTap: () => Get.toNamed(
                                            RouteHelper.getAllAppointmentPage()),
                                        number: controller.allAppointments.length
                                            .toString(),
                                        title: 'Appointments')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              }
            }));
  }
}
