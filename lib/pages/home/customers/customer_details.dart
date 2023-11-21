import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/profile/customer/customer_info_header.dart';
import 'package:fixify_admin/widgets/profile/profile_view_card.dart';
import 'package:fixify_admin/widgets/profile/user_info_text.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewCustomerInfoPage extends StatefulWidget {
  final String customerUid;

  const ViewCustomerInfoPage({Key? key, required this.customerUid})
      : super(key: key);

  @override
  State<ViewCustomerInfoPage> createState() => _ViewCustomerInfoPageState();
}

class _ViewCustomerInfoPageState extends State<ViewCustomerInfoPage> {
  @override
  Widget build(BuildContext context) {
    final userData = Get.find<HomeController>()
        .allCustomers
        .where((element) => element.uid == widget.customerUid)
        .singleOrNull;

    // List<String> selectedServices = [];

    return Scaffold(
        appBar: AppBar(
          leading:
          CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
          backgroundColor: AppColors.whiteColor,
        ),
        body: userData != null ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomerInfoHeader(fullName: userData.fullName?? '', joinedDate: userData.joinedDate ?? '', profilePicUrl: userData.profilePic?? '', ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Expanded(
              child: SingleChildScrollView(

                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.padding10),
                  child: ProfilePreviewCard(children: [
                    ///Services

                    UserInfoText(
                      text1: 'User Name',
                      text2: userData.uname ?? 'null',
                      fontSize: Dimensions.font14,
                    ),
                    UserInfoText(
                      text1: 'Full Name',
                      text2: userData.fullName ?? 'null',
                      fontSize: Dimensions.font14,
                    ),
                    UserInfoText(
                      text1: 'Email',
                      text2: userData.email ?? 'null',
                      fontSize: Dimensions.font14,
                    ),
                    UserInfoText(
                      text1: 'Phone No',
                      text2: userData.phoneNumber ?? 'null',
                      fontSize: Dimensions.font14,
                      borderSide: BorderSide.none,
                    ),
                    // ///Footer
                    // showFixifyFooter(),
                  ]),
                ),
              ),
            )
          ],
        ) : const SmallText(text: 'No data found!'));
  }
}
