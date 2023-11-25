import 'package:get/get.dart';

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
}