import 'package:estore_admin_panel/view/pages/dashboard/dashboard.dart';
import 'package:estore_admin_panel/view/pages/manage_customers_page/manage_customers_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController{
  List<Widget> screens = [
    const Dashboard(),
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Manage products'
      )
    ),
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Manage Categories'
      )
    ),
    /* Container(
      color: Colors.blue.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Manage customers'
      )
    ), */
    const ManageCustomers(),
    Container(
      color: Colors.purple.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Messages'
      )
    ),
  ];

  int selectedScreen = 0;

  onTapNavBar(int index) {
    selectedScreen = index;
    update();
  }
}