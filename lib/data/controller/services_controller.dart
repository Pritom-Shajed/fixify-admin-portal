import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServicesController extends GetxController {


  final includedTextController = [].obs;

  Future<void> addNewIncludedTextController () async{
    includedTextController.add(TextEditingController());
    update();
  }

  Future<void>  clearIncludedTextController ()async{
    includedTextController.clear();
  }

}