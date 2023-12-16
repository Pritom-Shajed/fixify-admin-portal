import 'package:fixify_admin/pages/auth/authentication_page.dart';
import 'package:fixify_admin/pages/home/appointments/all_appointments_page.dart';
import 'package:fixify_admin/pages/home/appointments/appointment_details_page.dart';
import 'package:fixify_admin/pages/home/banners/add_banner_page.dart';
import 'package:fixify_admin/pages/home/banners/all_banners_page.dart';
import 'package:fixify_admin/pages/home/customers/all_customer_page.dart';
import 'package:fixify_admin/pages/home/customers/customer_details.dart';
import 'package:fixify_admin/pages/home/services/add_service_page.dart';
import 'package:fixify_admin/pages/home/services/add_sub_service_page.dart';
import 'package:fixify_admin/pages/home/services/all_services_page.dart';
import 'package:fixify_admin/pages/home/services/service_details_page.dart';
import 'package:fixify_admin/pages/home/services/sub_service_page.dart';
import 'package:fixify_admin/pages/home/technicians/all_technician_page.dart';
import 'package:fixify_admin/pages/home/home_page.dart';
import 'package:fixify_admin/pages/home/technicians/technician_details.dart';
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

  static String allBannerPage = '/all-banner-page';
  static String getAllBannerPage ()=> allBannerPage;

  //Banner
  static String addBannerPage = '/add-banner-page';
  static String getAddBannerPage ({required String bannerTypeUid})=> '$addBannerPage?bannerTypeUid=$bannerTypeUid';


  //Technician
  static String allTechnicianPage = '/all-technicians-page';

  static String getAllTechnicianPage() => allTechnicianPage;

  static String viewTechnicianInfoPage = '/view-technician-info-page';

  static String getViewTechnicianInfoPage(String uid) => '$viewTechnicianInfoPage?uid=$uid';

  //Customer
  static String allCustomerPage = '/all-customer-page';

  static String getAllCustomerPage() => allCustomerPage;

  static String viewCustomerInfoPage = '/view-customer-info-page';

  static String getViewCustomerInfoPage(String uid) => '$viewCustomerInfoPage?uid=$uid';


  //Appointment
  static String allAppointmentPage = '/all-appointment-page';

  static String getAllAppointmentPage () => allAppointmentPage;

  static String appointmentDetailsPage = '/appointment-details-page';
  static String getAppointmentDetailsPage ({required String appointmentUid}) => '$appointmentDetailsPage?appointmentUid=$appointmentUid';

  //Service
  static String serviceDetailsPage = '/service-details-page';

  static String getServiceDetailsPage(
          {required String uid, required String index}) =>
      '$serviceDetailsPage?uid=$uid&index=$index';

  static String subServicePage = '/sub-service-page';

  static String getSubServicePage({required String uid}) =>
      '$subServicePage?uid=$uid';

  static String addServicePage = '/add-service-page';

  static String getAddServicePage() => addServicePage;

  static String addSubServicePage = '/add-sub-service-page';

  static String getAddSubServicePage(String serviceUid, String serviceName) => '$addSubServicePage?serviceUid=$serviceUid&serviceName=$serviceName';


  //Auth
  static String authPage = '/auth-page';

  static String getAuthPage() => authPage;

  static List<GetPage> routes = [

    //Splash Screen
    GetPage(
        name: splashScreen,
        transition: Transition.cupertino,
        page: () => const SplashScreen()),

    //Home Page
    GetPage(
        name: homePage,
        transition: Transition.cupertino,
        page: () => const HomePage()),


    //Auth
    GetPage(
        name: authPage,
        transition: Transition.cupertino,
        page: () => const AuthPage()),


    //Banner
    GetPage(
        name: allBannerPage,
        transition: Transition.cupertino,
        page: () => const AllBannersPage()),
    GetPage(
        name: addBannerPage,
        transition: Transition.cupertino,
        page: () {
          var uid = Get.parameters['bannerTypeUid']!;
          return AddBannerPage(bannerTypeUid: uid);
        }),


    //Customer
    GetPage(
        name: allCustomerPage,
        transition: Transition.cupertino,
        page: () => const AllCustomerPage()),
    GetPage(
        name: viewCustomerInfoPage,
        transition: Transition.cupertino,
        page: () {

          var uid = Get.parameters['uid']!;
          return ViewCustomerInfoPage(customerUid: uid);
        }),

    //Technician
    GetPage(
        name: allTechnicianPage,
        transition: Transition.cupertino,
        page: () => const AllTechnicianPage()),
    GetPage(
        name: viewTechnicianInfoPage,
        transition: Transition.cupertino,
        page: () {

          var uid = Get.parameters['uid']!;
          return ViewTechnicianInfoPage(technicianUid: uid);
        }),

    //Appointment
    GetPage(
        name: allAppointmentPage,
        transition: Transition.cupertino,
        page: () => const AllAppointmentsPage()),

    GetPage(
        name: appointmentDetailsPage,
        transition: Transition.cupertino,
        page: () {
          var appointmentUid = Get.parameters['appointmentUid']!;
          return AppointmentDetailsPage(appointmentUid: appointmentUid);
        }),

    //Service
    GetPage(
        name: allServicesPage,
        transition: Transition.cupertino,
        page: () => const AllServicesPage()),
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

    GetPage(
        name: addSubServicePage,
        transition: Transition.cupertino,
        page: () {
          var serviceUid = Get.parameters['serviceUid']!;
          var serviceName = Get.parameters['serviceName']!;
          return AddSubServicePage(
            serviceName: serviceName,
            serviceUid: serviceUid,
          );
        }),
  ];
}
