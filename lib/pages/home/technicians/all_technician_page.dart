import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/home/technician_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllTechnicianPage extends StatelessWidget {
  const AllTechnicianPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allTechnicians = Get.find<HomeController>().allTechnicians;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading:
            CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10 * 1),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
              height: Dimensions.height10,
            ),
            itemCount: allTechnicians.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = allTechnicians[index];
              return TechnicianCard(
                imageUrl: data.profilePic ??
                    'https://i.pinimg.com/736x/bb/e3/02/bbe302ed8d905165577c638e908cec76.jpg',
                name: data.nickName ?? 'null',
                time: '${data.time1} - ${data.time2}',
                location: data.division ?? 'null',
                services: data.services?.join(', ') ?? 'null',
              );
            })
      ),
    );
  }
}
