import 'package:estore_admin_panel/controllers/category_controller.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/categories_data_table.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (controller) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Align(
                  child: BigText(text: 'Manage Categories')),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: CategoriesDatatable(),
                ),
                const SizedBox(height: 10),
                CustomButtonAuth(
                  onPressed: () {
                    controller.manageCategoryToggleScreen(2);
                  },
                  text: '+ Add Category', width: 150.0)
              ],
            ),
          ),
        );
      }
    );
  }
}