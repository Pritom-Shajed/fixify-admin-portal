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

  Future<void> addBanner({required String bannerUid}) async {
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

      // // Create a ServicesModel object
      // BannerModel services = BannerModel(
      //   uid: uid,
      //   bannerType: selectedBannerCategory,
      //   bannerList: [
      //     BannerIndividual(
      //       bannerUid: bannerUid,
      //       bannerUrl: bannerUrl
      //     )
      //   ],
      // );

      // Add the banner data to Firestore
      await FirebaseFirestore.instance
          .collection('banners')
          .doc('a04c4ff0-9395-11ee-8d69-c33d70edb12f')
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

  // Future<void> addBanner(String bannerId,) async {
  //   try {
  //     EasyLoading.show(status: 'Adding sub-service...');
  //
  //     // Generate a unique, String text ID using Uuid
  //     var uid = const Uuid().v1();
  //
  //     // Create a reference for the sub-service picture
  //         Reference picRef = FirebaseStorage.instance
  //             .ref()
  //             .child('banners')
  //             .child(selectedBannerCategory)
  //             .child('${selectedBannerCategory}_$uid');
  //
  //     // Upload the sub-service picture
  //     TaskSnapshot picTaskSnapshot = await picRef.putFile(bannerPicture!);
  //     String bannerPicUrl = await picTaskSnapshot.ref.getDownloadURL();
  //
  //     // Create a SubService object
  //     BannerIndividual subService = BannerIndividual(
  //       bannerUrl: bannerPicUrl,
  //       bannerUid: uid,
  //     );
  //
  //     // Add the sub-service data to Firestore
  //     await FirebaseFirestore.instance
  //         .collection('banners')
  //         .doc(bannerId)
  //         .update({
  //       'bannerList': FieldValue.arrayUnion([subService.toJson()])
  //     }).whenComplete(() {
  //       showCustomSnackBar('Banner Added Successfully', title: 'Added');
  //       EasyLoading.dismiss();
  //       Get.offNamedUntil(RouteHelper.getHomePage(), (route) => route.isFirst);
  //     });
  //   } catch (e) {
  //     // Handle errors
  //     EasyLoading.dismiss();
  //     showCustomSnackBar('Oops! Try again after some time.', title: 'Error');
  //     throw Exception(e.toString());
  //   }
  // }

}