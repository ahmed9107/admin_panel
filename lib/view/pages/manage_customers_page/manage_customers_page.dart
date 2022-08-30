import 'package:estore_admin_panel/controllers/manage_customers_controllers/customer_controller.dart';
import 'package:estore_admin_panel/view/pages/manage_customers_page/add_screen/add_customer_screen.dart';
import 'package:estore_admin_panel/view/pages/manage_customers_page/edit_screen/edit_screen.dart';
import 'package:estore_admin_panel/view/pages/manage_customers_page/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageCustomers extends StatelessWidget {
  const ManageCustomers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      builder: (controller) {
        return controller.currentScreen == 0
          ? const MainScreen()
          : controller.currentScreen == 1 
            ? EditScreen(customer: controller.customer!)
            : const AddScreen();
      }
    );
  }
}