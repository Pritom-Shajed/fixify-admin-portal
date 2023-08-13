import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_admin/base/show_custom_snackbar.dart';
import 'package:fixify_admin/base/show_custom_toast.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:fixify_admin/utils/app_constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final _obscureTextSignIn = true.obs;
  final _authSignInError = false.obs;
  final SharedPreferences preferences;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthController({required this.preferences});

  final _emailController = TextEditingController().obs;

  get emailController => _emailController.value;

  final _passController = TextEditingController().obs;

  get passController => _passController.value;

  get obscureTextSignIn => _obscureTextSignIn.value;

  get authSignInError => _authSignInError.value;

  set obscureTextSignIn(value) {
    _obscureTextSignIn.value = value;
  }

  set authSignInError(value) {
    _authSignInError.value = value;
  }

  changeObscureTextSignIn() {
    obscureTextSignIn = !obscureTextSignIn;
    update();
  }

  isAuthSignInError() {
    if (emailController.text == '' || passController.text == '') {
      authSignInError = true;
    } else {
      authSignInError = false;
    }

    update();
  }

  bool userLoggedIn() {
    return preferences.containsKey(AppConstants.preferenceUid);
  }

  Future<dynamic> getUid() async {
    return preferences.getString(AppConstants.preferenceUid);
  }

  saveUid(String uid) async {
    return await preferences.setString(AppConstants.preferenceUid, uid);
  }

  Future<bool> clearSharedData() async {
    await preferences.remove(AppConstants.preferenceUid);

    return true;
  }

  Future<void> login() async {
    EasyLoading.show(status: 'Signing in');
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('admin')
          .where('email', isEqualTo: emailController.text)
          .where('pass', isEqualTo: passController.text)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data();
        final userUid = userData['uid'];
        await saveUid(userUid);
        EasyLoading.dismiss();
        Get.offAllNamed(RouteHelper.getHomePage());
      } else {
        EasyLoading.dismiss();
        showCustomSnackBar('Invalid credential provided', title: 'Error');
      }
    } catch (e) {
      EasyLoading.dismiss();
      showCustomSnackBar(e.toString(), title: 'Error', isError: true);
    }
  }

  Future<bool> checkLoginStatus() async {
    final userId = await getUid();
    if (userId != null) {
      final DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('admin').doc(userId).get();

      if (snapshot.exists) {
        Get.offAllNamed(RouteHelper.getHomePage());
        return true;
      } else {
        showCustomSnackBar('Kindly login first', title: 'Error');
      }
    }
    return false;
  }

  void signOut() {
    if (userLoggedIn()) {
      clearSharedData().then((done) {
        if (done) {
          Get.offAllNamed(RouteHelper.getAuthPage());
          showCustomToast('See ya admin!');
        }
      });
    }
  }
}
