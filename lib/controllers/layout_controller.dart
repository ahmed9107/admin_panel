import 'package:estore_admin_panel/view/pages/chat_page/chat_page.dart';
import 'package:estore_admin_panel/view/pages/dashboard/dashboard.dart';
import 'package:estore_admin_panel/view/pages/manage_categories_page/manage_categories_page.dart';
import 'package:estore_admin_panel/view/pages/manage_customers_page/manage_customers_page.dart';
import 'package:estore_admin_panel/view/pages/manage_products_page/manage_products_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutController extends GetxController{
  final SharedPreferences sharedPref;
  LayoutController({required this.sharedPref});

  List<Widget> screens = [
    const Dashboard(),
    const ManageProducts(),
    const ManageCategories(),
    const ManageCustomers(),
    const ChatPage(),
  ];

  int selectedScreen = 0;

  onTapNavBar(int index) {
    selectedScreen = index;
    update();
  }

  bool isDarkMode = false;

  void switchTheme(){
    isDarkMode= !isDarkMode;
    sharedPref.setBool('isDarkMode', isDarkMode);
    update();
  }

  @override
  void onInit() {
    isDarkMode = sharedPref.getBool('isDarkMode')??false;
    super.onInit();
  }
}