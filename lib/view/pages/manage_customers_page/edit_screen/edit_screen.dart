import 'package:estore_admin_panel/controllers/manage_customers_controllers/customer_controller.dart';
import 'package:estore_admin_panel/controllers/manage_customers_controllers/edit_customer_controller.dart';
import 'package:estore_admin_panel/models/customer_model.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  final CustomerData customer;
  const EditScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(text: 'Edit Customer'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.find<CustomerController>().manageCustomerToggleScreen(0);
          },
          child: Icon(
            EvaIcons.close, color: Theme.of(context).primaryColorLight
          ),
        )
      ),
      body: GetBuilder<EditCustomerController>(
        builder: (controller) {
          return Column(
            children: [
              CustomInputField(
                controller: controller.emailController,
                type: TextInputType.emailAddress,
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomInputField(
                controller: controller.nameController,
                type: TextInputType.text,
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomInputField(
                controller: controller.phoneController,
                type: TextInputType.number,
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomInputField(
                controller: controller.passwordController,
                type: TextInputType.text,
                hint: 'Enter New password',
                bgColor: Theme.of(context).backgroundColor
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: (){
                  controller.editCustomer(customer);
                },
                text: 'Submit',
              ),
            ],
          );
        }
      )
    );
  }
}