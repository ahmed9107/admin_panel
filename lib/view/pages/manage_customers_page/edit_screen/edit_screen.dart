import 'package:estore_admin_panel/controllers/manage_customers_controllers/edit_customer_controller.dart';
import 'package:estore_admin_panel/models/customer_model.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  final CustomerData customer;
  const EditScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<EditCustomerController>(
        builder: (controller) {
          controller.emailController.text = customer.email!;
          controller.nameController.text  = customer.name!;
          controller.phoneController.text = customer.phone!;
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const BigText(text: 'Edit Customer'),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.emailController,
                  type: TextInputType.emailAddress,
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.nameController,
                  type: TextInputType.text,
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.phoneController,
                  type: TextInputType.number,
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.passwordController,
                  type: TextInputType.text,
                  hint: 'Enter New password',
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomButtonAuth(
                  onPressed: (){
                    controller.editCustomer(customer);
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