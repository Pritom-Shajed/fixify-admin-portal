import 'package:fixify_admin/pages/auth/authentication_page.dart';
import 'package:fixify_admin/pages/home/all_customer_page.dart';
import 'package:fixify_admin/pages/home/all_services_page.dart';
import 'package:fixify_admin/pages/home/all_technician_page.dart';
import 'package:fixify_admin/pages/home/home_page.dart';
import 'package:fixify_admin/pages/splashscreen/splashscreen_page.dart';
import 'package:get/get.dart';

class RouteHelper {

  //Initial
  static String splashScreen = '/splash-screen';
  static String getSplashScreen () => splashScreen;

  //Home
  static String homePage = '/home-page';
  static String getHomePage() => homePage;
  static String allServicesPage ='/all-services-page';
  static String getAllServicesPage () => allServicesPage;
  static String allTechnicianPage ='/all-technician-page';
  static String getAllTechnicianPage () => allTechnicianPage;
  static String allCustomerPage ='/all-customer-page';
  static String getAllCustomerPage () => allCustomerPage;

  //Auth
  static String authPage = '/auth-page';
  static String getAuthPage() => authPage;



  static List<GetPage> routes = [
    GetPage(name: splashScreen, transition: Transition.cupertino, page: ()=> const SplashScreen()),
    GetPage(name: authPage, transition: Transition.cupertino, page: ()=> const AuthPage()),
    GetPage(name: homePage, transition: Transition.cupertino, page: ()=> const HomePage()),
    GetPage(name: allServicesPage, transition: Transition.cupertino, page: ()=> const AllServicesPage()),
    GetPage(name: allTechnicianPage, transition: Transition.cupertino, page: ()=> const AllTechnicianPage()),
    GetPage(name: allCustomerPage, transition: Transition.cupertino, page: ()=> const AllCustomerPage()),

  ];

}