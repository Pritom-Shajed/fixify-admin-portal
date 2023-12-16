import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/home/customer_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllCustomerPage extends StatelessWidget {
  const AllCustomerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allCustomers = Get
        .find<HomeController>()
        .allCustomers;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading:
        CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
        backgroundColor: AppColors.whiteColor,
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10, vertical: Dimensions.height10),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) =>
                SizedBox(height: Dimensions.height10,),
            itemCount: allCustomers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var data = allCustomers[index];
              return CustomerCard(imageUrl: data.profilePic ??
                  'https://i.pinimg.com/736x/bb/e3/02/bbe302ed8d905165577c638e908cec76.jpg',
                  name: data.uname ?? 'null',
                  email: data.email ?? 'null',
                  onTap: () => Get.toNamed(RouteHelper.getViewCustomerInfoPage(data.uid ?? '')));
            })
      ),
    );
  }
}
