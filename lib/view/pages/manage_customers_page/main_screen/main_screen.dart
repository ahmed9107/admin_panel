import 'package:estore_admin_panel/controllers/manage_customers_controllers/customer_controller.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/customers_data_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      builder: (controller) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Align(
                  child: BigText(text: 'Manage Customers')),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    controller.manageCustomerToggleScreen(2);
                  },
                  text: '+ Add Customer', width: 150.0),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Datatable(),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      }
    );
  }
}