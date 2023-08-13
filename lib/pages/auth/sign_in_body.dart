import 'package:fixify_admin/base/show_custom_auth_validator.dart';
import 'package:fixify_admin/data/controller/auth_controller.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fixify_admin/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInBody extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passController;

  const SignInBody(
      {Key? key, required this.emailController, required this.passController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(width: 3, color: AppColors.primaryColor)),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black, fontSize: Dimensions.font30),
                )),

            ///Error
            controller.authSignInError
                ? showCustomAuthValidator('Please fill up all required fields')
                : Container(),
            !controller.authSignInError
                ? SizedBox(
                    height: Dimensions.height10,
                  )
                : Container(),

            ///Email Address
            CustomTextField(
              titleText: 'Email Address',
              prefixIcon: Icon(
                Icons.email,
                size: Dimensions.icon20,
              ),
              hintText: 'Email Address',
              controller: emailController,
            ),

            ///Password
            CustomTextField(
              titleText: 'Password',
              suffixIcon: GestureDetector(
                onTap: () => controller.changeObscureTextSignIn(),
                child: Icon(
                  controller.obscureTextSignIn
                      ? Icons.visibility_off
                      : Icons.visibility,
                  size: Dimensions.icon20,
                ),
              ),
              prefixIcon: Icon(
                Icons.lock,
                size: Dimensions.icon20,
              ),
              obscureText: controller.obscureTextSignIn,
              hintText: 'Password',
              controller: passController,
            ),
          ],
        ),
      );
    });
  }
}
