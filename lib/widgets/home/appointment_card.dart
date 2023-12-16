import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String status;
  final String price;
  final String technicianUid;
  final String customerUid;

  const AppointmentCard(
      {Key? key,
        required this.onTap,
        required this.status,
        required this.price,
        required this.technicianUid,
        required this.customerUid,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    final customerInfo = Get.find<HomeController>().allCustomers.where((customer) => customer.uid == customerUid).single;
    final technicianInfo = Get.find<HomeController>().allTechnicians.where((technician) => technician.uid == technicianUid).single;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimensions.padding10),
        margin: EdgeInsets.symmetric(horizontal: Dimensions.margin10),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius4 * 3),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                  color: AppColors.shadowColor),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SmallText(
              text: status.toUpperCase(),
              fontWeight: FontWeight.bold,
              color: status == 'confirmed'
                  ? AppColors.positiveColor
                  : status == 'on progress'
                  ? AppColors.primaryColor
                  : AppColors.negativeColor,
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.height20 * 3,
                  width: Dimensions.height20 * 3,
                  child: Icon(Icons.work, color: AppColors.primaryColor, size: Dimensions.icon15*1.5,),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.monetization_on,
                                  size: Dimensions.icon15,
                                  color: AppColors.primaryColor,
                                ),
                                Expanded(
                                  child: SmallText(
                                    textAlign: TextAlign.start,
                                    text: ' $price',
                                    fontSize: Dimensions.font16 * 0.6,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      SmallText(
                        textAlign: TextAlign.start,
                        text: 'Customer: ${customerInfo.uname}',
                        fontWeight: FontWeight.w500,
                      ),
                      SmallText(
                        textAlign: TextAlign.start,
                        text: 'Technician: ${technicianInfo.nickName}',
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
