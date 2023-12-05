import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixify_admin/base/show_custom_toast.dart';
import 'package:fixify_admin/model/admin_info_model.dart';
import 'package:fixify_admin/model/banner_model.dart';
import 'package:fixify_admin/model/services_model.dart';
import 'package:fixify_admin/model/user_model_customer.dart';
import 'package:fixify_admin/model/user_model_technician.dart';
import 'package:fixify_admin/utils/app_constans.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   List<UserModelCustomer> allCustomers = [];
   List<UserModelTechnician> allTechnicians = [];
   List<ServicesModel> allServices = [];
   List<BannerModel> allBanners = [];
  AdminInfoModel? adminInfo;

  final SharedPreferences preferences;

  // bool _isLoading = true;
  // bool get isLoading => _isLoading;

  HomeController({required this.preferences});



  Future<void> fetchAllUsers() async {
    allCustomers = [];
    allTechnicians = [];
    try {
      final customer = await _firestore
          .collection('users')
          .where('userRole', isEqualTo: 'customer')
          .get();

      final technicians = await _firestore
          .collection('users')
          .where('userRole', isEqualTo: 'technician')
          .get();

    for (var users in customer.docs) {
      allCustomers.add(UserModelCustomer.fromSnap(users));
    }

      for (var users in technicians.docs) {
        allTechnicians.add(UserModelTechnician.fromSnap(users));
      }

      update();

    } catch (e) {
      showCustomToast('Error fetching users info');
      throw Exception('Error while fetching users info, Error: $e');
    }
  }

  Future<void> fetchAdminInfo() async{
    var uid = preferences.getString(AppConstants.preferenceUid);
    try {
      final admin = await _firestore.collection('admin').doc(uid).get();

      if(admin.exists){
        adminInfo = AdminInfoModel.fromSnap(admin);

        update();
      } else {
        showCustomToast('Admin\'s info not found!');
      }



    }catch (e){
      showCustomToast('Error fetching admin\'s info');
      throw Exception('Error while fetching admin info, Error: $e');
    }
  }

  Future<void> fetchAllServices () async{
    allServices = [];
    try {
      final services = await _firestore.collection('services').get();


      if (services.docs.isNotEmpty) {

        // // Convert the QuerySnapshot to a list of maps
        List<Map<String, dynamic>> data =
        services.docs.map((doc) => doc.data()).toList();

        // Convert the list of maps to a JSON string
        String jsonData = jsonEncode(data);


        List<dynamic> jsonList = json.decode(jsonData);

        allServices = jsonList.map((json) => ServicesModel.fromJson(json)).toList();

        update();

      }

    } catch (e) {

      throw Exception('Error while fetching services, Error: $e');
    }
  }

  Future<void> fetchAllBanners () async{
    allBanners = [];
    try {
      final banners = await _firestore.collection('banners').get();


      if (banners.docs.isNotEmpty) {

        // // Convert the QuerySnapshot to a list of maps
        List<Map<String, dynamic>> data =
        banners.docs.map((doc) => doc.data()).toList();

        // Convert the list of maps to a JSON string
        String jsonData = jsonEncode(data);


        List<dynamic> jsonList = json.decode(jsonData);

        allBanners = jsonList.map((json) => BannerModel.fromJson(json)).toList();

        update();

      }

    } catch (e) {

      throw Exception('Error while fetching banners, Error: $e');
    }
  }

  Future<void> loadInitialData () async{
    try {

      await fetchAdminInfo();
      await fetchAllUsers();
      await fetchAllServices();
      await fetchAllBanners();


    } catch(e){
      showCustomToast('Error fetching initial data');
    }

  }
}
