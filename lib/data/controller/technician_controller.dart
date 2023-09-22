import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_admin/base/show_custom_snackbar.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class TechnicianController extends GetxController {

  Future<void> updateAccountStatus ({required String uid, required String status}) async{

    try {

      EasyLoading.show(status: 'Working on it...');

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .update({
        'accountStatus': status,
      }).whenComplete(() {
        showCustomSnackBar( status == 'Active' ? 'Account activated' : 'Account suspended',
            title: 'Done');
        EasyLoading.dismiss();
        Get.offNamedUntil(RouteHelper.getHomePage(), (route) => route.isFirst);
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}