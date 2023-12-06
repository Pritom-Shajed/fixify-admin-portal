import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixify_admin/base/show_custom_snackbar.dart';
import 'package:fixify_admin/model/banner_model.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class BannerController extends GetxController {

  final _selectedBannerCategory = 'Dashboard Banner'.obs;

  get selectedBannerCategory => _selectedBannerCategory.value;

  set selectedBannerCategory (value){
    _selectedBannerCategory.value = value;
  }

  updateSelectedBannerCategory (String banner){
    selectedBannerCategory = banner;
    update();
  }

  File? bannerPicture;

  pickBanner(ImageSource src) async {
    XFile? xfile = await ImagePicker().pickImage(source: src);
    if (xfile != null) {
      bannerPicture = File(xfile.path);
      update();
    }
  }

  Future<void> addBanner({required String bannerTypeUid}) async {
    try {
      EasyLoading.show(status: 'Adding banner...');

      var bannerUid = const Uuid().v1();

      // Create a reference for the service icon
      Reference iconRef = FirebaseStorage.instance
          .ref()
          .child('banners')
          .child(selectedBannerCategory)
          .child('${selectedBannerCategory}_$bannerUid');

      // Upload the service icon
      TaskSnapshot iconTaskSnapshot = await iconRef.putFile(bannerPicture!);
      String bannerUrl = await iconTaskSnapshot.ref.getDownloadURL();


      BannerIndividual banner =  BannerIndividual(
          bannerUid: bannerUid,
          bannerUrl: bannerUrl
      );


      // Add the banner data to Firestore
      await FirebaseFirestore.instance
          .collection('banners')
          .doc(bannerTypeUid)
          .update({
        'bannerList': FieldValue.arrayUnion([banner.toJson()])
      })
          .whenComplete(() {
        EasyLoading.dismiss();
        showCustomSnackBar('New Banner Added', title: 'Added');
        Get.offNamedUntil(RouteHelper.getHomePage(), (route) => route.isFirst);
      });
    } catch (e) {
      // Handle errors
      EasyLoading.dismiss();
      showCustomSnackBar('Oops! Try again after some time.', title: 'Error');
      throw Exception(e.toString());
    }
  }

  Future<void> addBannerType({required String bannerType}) async {
    try {
      EasyLoading.show(status: 'Adding new type...');

      // Generate a unique, String text ID using Uuid
      var uid = const Uuid().v1();


      BannerModel services = BannerModel(
        uid: uid,
        bannerType: bannerType,
        bannerList: [],
      );

      // Add the sub-service data to Firestore
      await FirebaseFirestore.instance
          .collection('banners')
          .doc(uid)
          .set(services.toJson()).whenComplete(() {
        showCustomSnackBar('New Type Added Successfully', title: 'Added');
        EasyLoading.dismiss();
        Get.offNamedUntil(RouteHelper.getHomePage(), (route) => route.isFirst);
      });
    } catch (e) {
      // Handle errors
      EasyLoading.dismiss();
      showCustomSnackBar('Oops! Try again after some time.', title: 'Error');
      throw Exception(e.toString());
    }
  }

}