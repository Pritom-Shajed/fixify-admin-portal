import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/home/info_text.dart';
import 'package:fixify_admin/widgets/texts/text_with_underline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentInfoCard extends StatelessWidget {
  final String appointmentUid;

  const AppointmentInfoCard(
      {Key? key,required this.appointmentUid,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appointmentInfo = Get.find<HomeController>().allAppointments.where((appointment) => appointment.id == appointmentUid).single;

    final customerInfo = Get.find<HomeController>().allCustomers.where((user) => user.uid == appointmentInfo.customerUid).single;
    final technicianInfo = Get.find<HomeController>().allTechnicians.where((user) => user.uid == appointmentInfo.technicianUid).single;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWithUnderline(
          text: 'Hiring Information',
          fontSize: Dimensions.font14,
        ),
        SizedBox(height: Dimensions.height10 * 3),
        InfoText(
          text1: 'Current Price',
          text2: '${appointmentInfo.price} ৳',
          fontSize: Dimensions.font14,
        ),
        InfoText(
          text1: 'Last Updated By',
          text2: '${appointmentInfo.lastUpdated}',
          fontSize: Dimensions.font14,
        ),
        InfoText(
          text1: 'Services Covered',
          text2: '${appointmentInfo.serviceName?.join(', ')}',
          fontSize: Dimensions.font14,
        ),
        InfoText(
          text1: 'Job Description',
          text2: '${appointmentInfo.jobDescription}',
          maxLines: 100,
          fontSize: Dimensions.font14,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        TextWithUnderline(
          text: 'Customer\'s Information',
          fontSize: Dimensions.font14,
        ),
        SizedBox(height: Dimensions.height10 * 3),
        InfoText(
          text1: 'Name',
          text2: '${customerInfo.fullName}',
          fontSize: Dimensions.font14,
        ),
        InfoText(
          text1: 'Email',
          text2: '${customerInfo.email}',
          fontSize: Dimensions.font14,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        TextWithUnderline(
          text: 'Technicians\'s Information',
          fontSize: Dimensions.font14,
        ),
        SizedBox(height: Dimensions.height10 * 3),
        InfoText(
          text1: 'Name',
          text2: '${technicianInfo.fullName}',
          fontSize: Dimensions.font14,
        ),
        InfoText(
          text1: 'Email',
          text2: '${technicianInfo.email}',
          fontSize: Dimensions.font14,
        ),
        InfoText(
          text1: 'Working Area',
          text2: '${technicianInfo.preferredArea}, ${technicianInfo.division}',
          fontSize: Dimensions.font14,
        ),
        InfoText(
          text1: 'Availability',
          text2: '${technicianInfo.workDays?.join(', ')}\n${technicianInfo.time1} - ${technicianInfo.time2}',
          fontSize: Dimensions.font14,
        ),
      ],
    );
  }
}
