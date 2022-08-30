import 'package:estore_admin_panel/controllers/manage_customers_controllers/add_customer_controller.dart';
import 'package:estore_admin_panel/controllers/manage_customers_controllers/customer_controller.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(text: 'Add Customer'),
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
      body: GetBuilder<AddCustomerController>(
        builder: (controller) {
          return Column(
            children: [
              CustomInputField(
                controller: controller.emailController,
                type: TextInputType.emailAddress,
                hint: 'Enter customer email',
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomInputField(
                controller: controller.nameController,
                type: TextInputType.text,
                hint: 'Enter customer name',
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomInputField(
                controller: controller.phoneController,
                type: TextInputType.number,
                hint: 'Enter phone number',
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomInputField(
                controller: controller.passwordController,
                type: TextInputType.text,
                hint: 'Enter password',
                bgColor: Theme.of(context).backgroundColor
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: (){
                  controller.addCustomer();
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