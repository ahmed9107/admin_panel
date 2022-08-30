import 'package:estore_admin_panel/controllers/manage_products_controller/product_controller.dart';
import 'package:estore_admin_panel/view/pages/manage_products_page/add_screen/add_screen.dart';
import 'package:estore_admin_panel/view/pages/manage_products_page/edit_screen/edit_screen.dart';
import 'package:estore_admin_panel/view/pages/manage_products_page/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return controller.currentScreen == 0
          ? const MainScreen()
          : controller.currentScreen == 1 
            ? EditScreen(product: controller.productData!)
            : const AddScreen();
      }
    );
  }
}