import 'package:fixify_admin/data/controller/auth_controller.dart';
import 'package:fixify_admin/data/controller/home_controller.dart';
import 'package:fixify_admin/data/controller/services_controller.dart';
import 'package:fixify_admin/data/controller/technician_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async{
  final preference = await SharedPreferences.getInstance();

  //Shared Preference
  Get.lazyPut(() => preference, fenix: true);

  Get.lazyPut(() => AuthController(preferences: Get.find(),), fenix: true);
  Get.lazyPut(() => HomeController(preferences: Get.find()), fenix: true);
  Get.lazyPut(() => ServicesController(), fenix: true);

  //Technician
  Get.lazyPut(() => TechnicianController(), fenix: true);
}