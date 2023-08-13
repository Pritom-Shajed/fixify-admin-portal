import 'dart:async';

import 'package:fixify_admin/data/controller/auth_controller.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final signInController = Get.find<AuthSignInController>();
  //
  @override
  void initState() {
    Timer(
        const Duration(seconds: 1),
        () =>  Get.find<AuthController>().checkLoginStatus().then((isLoggedIn) {
          if(!isLoggedIn) {
            Get.offAllNamed(RouteHelper.getAuthPage());
          }
        }));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Dimensions.splashScreenLogoSize200,
                child: Image.asset('assets/icons/fixify_logo.png'),
              ),
              const SmallText(text: 'Simplifying Technician Solutions'),

            ],
          ),
        ),
      ),
    );
  }
}
