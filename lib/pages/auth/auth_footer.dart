import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatefulWidget {
  VoidCallback onTapSignIn;
  VoidCallback onTapForgotPass;

  AuthFooter(
      {Key? key,
      required this.onTapSignIn,
      required this.onTapForgotPass})
      : super(key: key);

  @override
  State<AuthFooter> createState() => _AuthFooterState();
}

class _AuthFooterState extends State<AuthFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RichText(
        //     text: TextSpan(
        //         text: 'Don\'t have an account? ',
        //         style: TextStyle(
        //             color: Colors.black, fontSize: Dimensions.font12),
        //         children: [
        //           TextSpan(
        //             text: 'Signup',
        //             style: TextStyle(
        //                 color: AppColors.primaryColor,
        //                 fontWeight: FontWeight.w500,
        //                 fontSize: Dimensions.font14),
        //             recognizer: TapGestureRecognizer()
        //               ..onTap = widget.onTapSignUp,
        //           )
        //         ])),
        // SizedBox(
        //   height: Dimensions.height20,
        // ),
        RichText(
            text: TextSpan(
                text: 'Forgot password? ',
                style: TextStyle(
                    color: Colors.black, fontSize: Dimensions.font12),
                children: [
                  TextSpan(
                    text: 'Reset',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.font14),
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onTapForgotPass,
                  )
                ])),
      ],
    );
  }
}
