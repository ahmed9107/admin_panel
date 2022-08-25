import 'package:estore_admin_panel/view/layout/layout.dart';
import 'package:estore_admin_panel/view/pages/auth/login_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String chatPage            = "/chat";
  static const String editProfilePage     = "/edit-profile";
  static const String initial             = "/layout";
  static const String login               = "/";
  static const String notificationPage    = "/notification";
  static const String searchPage          = "/search";

  static String getInitial() => initial;
  static String getSearchPage() => searchPage;
  static String getChatPage() => chatPage;
  static String getEditProfilePage() => editProfilePage;
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
      name: chatPage,
      page: () => const ChatPage(),
      transition: Transition.fadeIn),

    GetPage(
      name: searchPage,
      page: () => const SearchPage(),
      transition: Transition.fadeIn), */
  ];
}
