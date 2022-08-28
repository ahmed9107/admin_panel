import 'package:estore_admin_panel/view/layout/layout.dart';
import 'package:estore_admin_panel/view/pages/auth/login_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String chatPage            = "/chat";
  //static const String editCustomerPage     = "/edit-customer";
  static const String initial             = "/layout";
  static const String login               = "/";
  static const String notificationPage    = "/notification";
  static const String searchPage          = "/search";

  static String getInitial() => initial;
  static String getSearchPage() => searchPage;
  static String getChatPage() => chatPage;
  //static String getEditCustomerPage() => editCustomerPage;
  static String getNotificationPage() => notificationPage;
  static String getLogin() => login;

  static List<GetPage> routes = [
    GetPage(
      name: login,
      page: () => const LoginPage(),
      transition: Transition.fadeIn),

    GetPage(
      name: initial,
      page: () => const Layout(),
      transition: Transition.fadeIn),
    
    /* GetPage(
      name: editCustomerPage,
      page: () {
        CustomerData editCustomerPage = Get.arguments;
        return EditScreen(customer: editCustomerPage);},
      transition: Transition.fadeIn), */

    /* GetPage(
      name: searchPage,
      page: () => const SearchPage(),
      transition: Transition.fadeIn), */
  ];
}
