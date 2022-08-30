import 'package:estore_admin_panel/controllers/manage_categories_controller/category_controller.dart';
import 'package:estore_admin_panel/view/pages/manage_categories_page/add_screen/add_screen.dart';
import 'package:estore_admin_panel/view/pages/manage_categories_page/edit_screen/edit_screen.dart';
import 'package:estore_admin_panel/view/pages/manage_categories_page/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageCategories extends StatelessWidget {
  const ManageCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        return controller.currentScreen == 0
          ? const MainScreen()
          : controller.currentScreen == 1 
            ? EditScreen(category: controller.category!)
            : const AddScreen();
      }
    );
  }
}