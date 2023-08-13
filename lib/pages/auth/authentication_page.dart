import 'package:fixify_admin/base/show_custom_loader.dart';
import 'package:fixify_admin/data/controller/auth_controller.dart';
import 'package:fixify_admin/pages/auth/auth_body.dart';
import 'package:fixify_admin/pages/auth/sign_in_body.dart';
import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/widgets/buttons/custom_button.dart';
import 'package:fixify_admin/widgets/buttons/custom_button2.dart';
import 'package:fixify_admin/widgets/texts/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import '../../utils/dimensions.dart';
import 'auth_footer.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBgColor,
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: AppColors.mainBgColor,
          ),
          child: Stack(
            children: [
              //BG STYLE
              ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.screenHeight / 2,
                    color: AppColors.primaryColorLight,
                  )),

              //BODY
              Padding(
                padding: EdgeInsets.only(top: Dimensions.height10 * 7),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///LOGO
                        Column(
                          children: [
                            SizedBox(
                              width: Dimensions.authLogoSize,
                              child:
                                  Image.asset('assets/icons/fixify_logo.png'),
                            ),
                            SmallText(
                              text: 'Admin Portal',
                              fontSize: Dimensions.font14,
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),

                        ///BODY
                        AuthBody(
                            signInBody: SignInBody(
                              emailController: authController.emailController,
                              passController: authController.passController,
                            ),
                            signInButton: CustomButton(
                                text: 'Sign In',
                                onTap: () async{
                                  await authController.isAuthSignInError();
                                  authController.authSignInError ? null : authController.login();
                                })),

                        SizedBox(height: Dimensions.height20 * 2),

                        ///FOOTER
                        AuthFooter(
                          onTapSignIn: () {
                            authController.isAuthSignInError();
                          },
                          onTapForgotPass: () {},
                        ),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
