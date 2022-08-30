import 'package:estore_admin_panel/controllers/manage_products_controller/product_controller.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/product_data_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Align(
                  child: BigText(text: 'Manage Products')),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    controller.manageProductToggleScreen(2);
                  },
                  text: '+ Add Product', width: 150.0),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: ProductsDatatable(),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}