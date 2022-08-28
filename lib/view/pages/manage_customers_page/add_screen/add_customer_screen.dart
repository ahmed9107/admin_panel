import 'package:estore_admin_panel/controllers/manage_customers_controllers/add_customer_controller.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AddCustomerController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const BigText(text: 'Add Customer'),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.emailController,
                  type: TextInputType.emailAddress,
                  hint: 'Enter customer email',
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.nameController,
                  type: TextInputType.text,
                  hint: 'Enter customer name',
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.phoneController,
                  type: TextInputType.number,
                  hint: 'Enter phone number',
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.passwordController,
                  type: TextInputType.text,
                  hint: 'Enter password',
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomButtonAuth(
                  onPressed: (){
                    controller.addCustomer();
                  },
                  text: 'Submit',
                ),
              ],
            ),
          );
        }
      )
    );
  }
}