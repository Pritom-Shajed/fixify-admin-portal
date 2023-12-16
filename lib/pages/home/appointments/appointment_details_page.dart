import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/home/appointment_info_card.dart';
import 'package:fixify_admin/widgets/home/appointment_status_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentDetailsPage extends StatelessWidget {
  final String appointmentUid;
  const AppointmentDetailsPage({Key? key, required this.appointmentUid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appointmentDetails = Get.find<HomeController>().allAppointments.where((appointment) => appointment.id ==appointmentUid).single;
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        backgroundColor: AppColors.whiteColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Dimensions.screenHeight *0.1,
            width: double.maxFinite,
            color: AppColors.mainBgColor.withOpacity(0.3),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              child: AppointmentStatusText(status: appointmentDetails.status ?? 'null'),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                  padding: EdgeInsets.all(Dimensions.padding15 * 1.5),
                  child: AppointmentInfoCard(
                    appointmentUid: appointmentUid,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
