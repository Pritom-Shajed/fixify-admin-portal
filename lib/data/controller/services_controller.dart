import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fixify_admin/base/show_custom_snackbar.dart';
import 'package:fixify_admin/model/services_model.dart';
import 'package:fixify_admin/routes/route_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ServicesController extends GetxController {
  final includedTextController = [].obs;

  Future<void> addNewIncludedTextController() async {
    includedTextController.add(TextEditingController());
    update();
  }

  Future<void> removeIncludedTextController() async {
    includedTextController.removeLast();
    update();
  }

  Future<void> clearIncludedTextController() async {
    includedTextController.clear();
  }

  File? serviceIcon;
  File? servicePicture;

  Future<void> clearPictures() async {
    servicePicture = null;
    serviceIcon = null;
    update();
  }

  pickIcon(ImageSource src) async {
    XFile? xfile = await ImagePicker().pickImage(source: src);
    if (xfile != null) {
      serviceIcon = File(xfile.path);
      update();
    }
  }

  pickPicture(ImageSource src) async {
    XFile? xfile = await ImagePicker().pickImage(source: src);
    if (xfile != null) {
      servicePicture = File(xfile.path);
      update();
    }
  }

  Future<void> addService(String serviceName, String subServiceName) async {
    try {
      EasyLoading.show(status: 'Adding service...');
      // Generate a unique ID using Uuid
      var uid = const Uuid().v4();

      // Create a reference for the service icon
      Reference iconRef = FirebaseStorage.instance
          .ref()
          .child('services')
          .child(serviceName)
          .child('${serviceName}_icon_$uid');

      // Upload the service icon
      TaskSnapshot iconTaskSnapshot = await iconRef.putFile(serviceIcon!);
      String serviceIconUrl = await iconTaskSnapshot.ref.getDownloadURL();

      // Create a reference for the service picture
      Reference picRef = FirebaseStorage.instance
          .ref()
          .child('services')
          .child(serviceName)
          .child('sub-services')
          .child('${serviceName}_sub_service_$uid');

      // Upload the service picture
      TaskSnapshot picTaskSnapshot = await picRef.putFile(servicePicture!);
      String servicePicUrl = await picTaskSnapshot.ref.getDownloadURL();

      // Create a ServicesModel object
      ServicesModel services = ServicesModel(
        uid: uid,
        icon: serviceIconUrl,
        name: serviceName,
        subService: [
          Service(
            imageUrl: servicePicUrl,
            title: subServiceName,
            included: includedTextController
                .map((controller) => controller.text)
                .toList(),
          ),
        ],
      );

      // Add the services data to Firestore
      await FirebaseFirestore.instance
          .collection('services')
          .doc(uid)
          .set(services.toJson())
          .whenComplete(() {
        EasyLoading.dismiss();
        showCustomSnackBar('New Service Added', title: 'Added');
        Get.offNamedUntil(RouteHelper.getHomePage(), (route) => route.isFirst);
      });
    } catch (e) {
      // Handle errors
      EasyLoading.dismiss();
      showCustomSnackBar('Oops! Try again after some time.', title: 'Error');
      throw Exception(e.toString());
    }
  }

  Future<void> addSubService(
      String serviceName, String serviceId, String subServiceName) async {
    try {
      EasyLoading.show(status: 'Adding sub-service...');

      // Generate a unique, String text ID using Uuid
      var uid = const Uuid().v4();

      // Create a reference for the sub-service picture
      Reference picRef = FirebaseStorage.instance
          .ref()
          .child('services')
          .child(serviceName)
          .child('sub-services')
          .child('${serviceName}_sub_service_$uid');

      // Upload the sub-service picture
      TaskSnapshot picTaskSnapshot = await picRef.putFile(servicePicture!);
      String subServicePicUrl = await picTaskSnapshot.ref.getDownloadURL();

      // Create a SubService object
      Service subService = Service(
        imageUrl: subServicePicUrl,
        title: subServiceName,
        included: includedTextController
            .map((controller) => controller.text)
            .toList(),
      );

      // Add the sub-service data to Firestore
      await FirebaseFirestore.instance
          .collection('services')
          .doc(serviceId)
          .update({
        'service': FieldValue.arrayUnion([subService.toJson()])
      }).whenComplete(() {
        showCustomSnackBar('Sub-Service Added to $serviceName', title: 'Added');
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
