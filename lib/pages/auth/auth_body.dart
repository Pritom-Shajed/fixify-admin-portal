import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AuthBody extends StatelessWidget {
  final Widget signInBody;
  final Widget signInButton;

  const AuthBody(
      {Key? key,
      required this.signInBody,
      required this.signInButton,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.authBodyHeight375,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(Dimensions.width10),
            padding: EdgeInsets.only(bottom: Dimensions.height20),
            height: Dimensions.authBodyHeight350,
            width: Dimensions.screenWidth*0.75,
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(Dimensions.radius4*3),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                      color: AppColors.shadowColor),
                ]
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.height20,),
              child: signInBody,
            ),
          ),
          Positioned(
              bottom: 0,
              left: Dimensions.width10*9,
              right: Dimensions.width10*9,
              child: signInButton),
        ],
      ),
    );
  }
}
