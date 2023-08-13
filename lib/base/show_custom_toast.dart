import 'package:fixify_admin/utils/app_colors.dart';
import 'package:fixify_admin/utils/dimensions.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomToast(String message, {bool isError = false, Toast? toastLength}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: isError ? AppColors.redColor : AppColors.blackColor,
      textColor: AppColors.whiteColor,
      fontSize: Dimensions.font14);
}