import 'package:fixify_admin/base/show_custom_status_dialog.dart';
import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/data/controller/technician_controller.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/buttons/custom_icon_button.dart';
import 'package:fixify_admin/widgets/profile/profile_view_card.dart';
import 'package:fixify_admin/widgets/profile/technician/technician_info_header.dart';
import 'package:fixify_admin/widgets/profile/technician/technician_info_short_card.dart';
import 'package:fixify_admin/widgets/profile/user_info_text.dart';
import 'package:fixify_admin/widgets/texts/medium_text.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewTechnicianInfoPage extends StatefulWidget {
  final String technicianUid;

  const ViewTechnicianInfoPage({Key? key, required this.technicianUid})
      : super(key: key);

  @override
  State<ViewTechnicianInfoPage> createState() => _ViewTechnicianInfoPageState();
}

class _ViewTechnicianInfoPageState extends State<ViewTechnicianInfoPage> {
  @override
  Widget build(BuildContext context) {
    final userData = Get.find<HomeController>()
        .allTechnicians
        .where((element) => element.uid == widget.technicianUid)
        .single;

    // List<String> selectedServices = [];

    return Scaffold(
        appBar: AppBar(
          leading:
              CustomIconButton(icon: Icons.arrow_back, onTap: () => Get.back()),
          backgroundColor: AppColors.whiteColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TechnicianInfoHeader(
                onTapStatus: () => showCustomStatusDialog(context,
                    status: '${userData.accountStatus}',
                    onTap: () => Get.find<TechnicianController>()
                        .updateAccountStatus(
                            uid: userData.uid!,
                            status: userData.accountStatus == 'Inactive' ||
                                    userData.accountStatus == 'Suspended'
                                ? 'Active'
                                : 'Suspended')),
                status: userData.accountStatus!,
                fullName: userData.fullName!,
                nickName: userData.nickName!,
                division: userData.division!,
                area: userData.preferredArea!,
                profilePicUrl: userData.profilePic!),
            SizedBox(
              height: Dimensions.height10,
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TechnicianInfoShortCard(
                          largeText: userData.worksDone.toString(),
                          smallText: 'Works Done',
                        ),
                      ),
                      const Expanded(
                        child: TechnicianInfoShortCard(
                          largeText: '0',
                          smallText: 'Current Works',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimensions.padding10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfilePreviewCard(children: [
                          ///Services
                          MediumText(
                            text: 'Services',
                            fontSize: Dimensions.font14,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: Dimensions.margin10),
                            height: Dimensions.height20 * 2,
                            alignment: Alignment.topLeft,
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                separatorBuilder: (context, index) => SizedBox(
                                      width: Dimensions.width10,
                                    ),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: userData.services!.length,
                                itemBuilder: (context, index) {
                                  final service = userData.services![index];
                                  return Container(
                                    padding:
                                        EdgeInsets.all(Dimensions.padding5 / 2),
                                    alignment: Alignment.center,
                                    width: Dimensions.width150 / 1.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius4),
                                      color: AppColors.primaryColor
                                          .withOpacity(0.08),
                                    ),
                                    child: SmallText(
                                      text: service,
                                      color: AppColors.primaryColor,
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),

                          UserInfoText(
                            text1: 'Nickname',
                            text2: userData.nickName!,
                            fontSize: Dimensions.font14,
                          ),
                          UserInfoText(
                            text1: 'Joined',
                            text2: userData.joinedDate!,
                            fontSize: Dimensions.font14,
                          ),
                          UserInfoText(
                            text1: 'Email',
                            text2: userData.email!,
                            fontSize: Dimensions.font14,
                          ),
                          UserInfoText(
                            text1: 'Preferred Area',
                            text2:
                                "${userData.preferredArea!}, ${userData.division}",
                            fontSize: Dimensions.font14,
                          ),
                          UserInfoText(
                            text1: 'NID Number',
                            text2: userData.nidNumber!,
                            fontSize: Dimensions.font14,
                          ),
                          UserInfoText(
                            text1: 'Work Days',
                            text2: userData.workDays!.join(', '),
                            fontSize: Dimensions.font14,
                          ),
                          UserInfoText(
                              text1: 'Work Time',
                              text2: '${userData.time1} to ${userData.time2}',
                              fontSize: Dimensions.font14,
                              borderSide: BorderSide.none),

                          // ///Footer
                          // showFixifyFooter(),
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
