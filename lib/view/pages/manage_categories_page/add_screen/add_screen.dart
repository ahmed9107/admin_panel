import 'package:estore_admin_panel/controllers/manage_categories_controller/add_category_controller.dart';
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
      body: GetBuilder<AddCategoryController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const BigText(text: 'Add Customer'),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.nameController,
                  type: TextInputType.text,
                  hint: 'Enter category english name',
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.nameArController,
                  type: TextInputType.text,
                  hint: 'Enter category arabic name',
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.nameFrController,
                  type: TextInputType.text,
                  hint: 'Enter category french name',
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.imageController,
                  type: TextInputType.text,
                  hint: 'Image',
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomButtonAuth(
                  onPressed: (){
                    controller.addCategory();
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