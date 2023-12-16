import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/home/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAppointmentsPage extends StatelessWidget {
  const AllAppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onProgressAppointments = Get.find<HomeController>().allAppointments.where((appointment) => appointment.status == 'on progress').toList();
    final rejectedAppointments = Get.find<HomeController>().allAppointments.where((appointment) => appointment.status == 'rejected').toList();
    final confirmedAppointments = Get.find<HomeController>().allAppointments.where((appointment) => appointment.status == 'confirmed').toList();

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          leading: CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
          backgroundColor: AppColors.whiteColor,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Confirmed'),
              Tab(text: 'On progress'),
              Tab(text: 'Rejected'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.padding10),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: Dimensions.height10,
                ),
                itemCount: confirmedAppointments.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = confirmedAppointments[index];
                  return AppointmentCard(
                    onTap: () => Get.toNamed(RouteHelper.getAppointmentDetailsPage(appointmentUid: data.id ?? 'null')),

                    status: data.status ?? 'null',
                    price: data.price ?? 'null',
                    technicianUid: data.technicianUid ?? 'null',
                    customerUid: data.customerUid ?? 'null',
                  );
                },
              ),
            ),

            // Tab 2
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.padding10),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: Dimensions.height10,
                ),
                itemCount: onProgressAppointments.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = onProgressAppointments[index];
                  return AppointmentCard(
                    onTap: () => Get.toNamed(RouteHelper.getAppointmentDetailsPage(appointmentUid: data.id ?? 'null')),
                    status: data.status ?? 'null',
                    price: data.price ?? 'null',
                    technicianUid: data.technicianUid ?? 'null',
                    customerUid: data.customerUid ?? 'null',
                  );
                },
              ),
            ),

            // Tab 3
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.padding10),
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(
                  height: Dimensions.height10,
                ),
                itemCount: rejectedAppointments.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var data = rejectedAppointments[index];
                  return AppointmentCard(
                    onTap: () => Get.toNamed(RouteHelper.getAppointmentDetailsPage(appointmentUid: data.id ?? 'null')),
                    status: data.status ?? 'null',
                    price: data.price ?? 'null',
                    technicianUid: data.technicianUid ?? 'null',
                    customerUid: data.customerUid ?? 'null',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
