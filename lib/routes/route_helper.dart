import 'package:fixify_admin/pages/auth/authentication_page.dart';
import 'package:fixify_admin/pages/home/customers/all_customer_page.dart';
import 'package:fixify_admin/pages/home/services/add_service_page.dart';
import 'package:fixify_admin/pages/home/services/all_services_page.dart';
import 'package:fixify_admin/pages/home/services/service_details_page.dart';
import 'package:fixify_admin/pages/home/services/sub_service_page.dart';
import 'package:fixify_admin/pages/home/technicians/all_technician_page.dart';
import 'package:fixify_admin/pages/home/home_page.dart';
import 'package:fixify_admin/pages/splashscreen/splashscreen_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  //Initial
  static String splashScreen = '/splash-screen';

  static String getSplashScreen() => splashScreen;

  //Home
  static String homePage = '/home-page';

  static String getHomePage() => homePage;
  static String allServicesPage = '/all-services-page';

  static String getAllServicesPage() => allServicesPage;
  static String allTechnicianPage = '/all-technicians-page';

  static String getAllTechnicianPage() => allTechnicianPage;
  static String allCustomerPage = '/all-customer-page';

  static String getAllCustomerPage() => allCustomerPage;

  static String serviceDetailsPage = '/service-details-page';

  static String getServiceDetailsPage(
          {required String uid, required String index}) =>
      '$serviceDetailsPage?uid=$uid&index=$index';

  static String subServicePage = '/sub-service-page';

  static String getSubServicePage({required String uid}) =>
      '$subServicePage?uid=$uid';

  static String addServicePage = '/add-service-page';

  static String getAddServicePage() => addServicePage;

  //Auth
  static String authPage = '/auth-page';

  static String getAuthPage() => authPage;

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        transition: Transition.cupertino,
        page: () => const SplashScreen()),
    GetPage(
        name: authPage,
        transition: Transition.cupertino,
        page: () => const AuthPage()),
    GetPage(
        name: homePage,
        transition: Transition.cupertino,
        page: () => const HomePage()),
    GetPage(
        name: allServicesPage,
        transition: Transition.cupertino,
        page: () => const AllServicesPage()),
    GetPage(
        name: allTechnicianPage,
        transition: Transition.cupertino,
        page: () => const AllTechnicianPage()),
    GetPage(
        name: allCustomerPage,
        transition: Transition.cupertino,
        page: () => const AllCustomerPage()),
    GetPage(
        name: subServicePage,
        transition: Transition.cupertino,
        page: () {
          var uid = Get.parameters['uid']!;
          return SubServicePage(
            uid: uid,
          );
        }),
    GetPage(
        name: serviceDetailsPage,
        transition: Transition.cupertino,
        page: () {
          var uid = Get.parameters['uid']!;
          var index = Get.parameters['index']!;
          return ServiceDetailPage(
            uid: uid,
            index: int.parse(index),
          );
        }),
    GetPage(
        name: addServicePage,
        transition: Transition.cupertino,
        page: () => const AddServicePage()),
  ];
}
