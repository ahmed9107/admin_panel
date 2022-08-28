import 'package:estore_admin_panel/controllers/manage_categories_controller/edit_category_controller.dart';
import 'package:estore_admin_panel/models/categories_model.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  final CategoriesData category;
  const EditScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<EditCategoryController>(
        builder: (controller) {
          controller.nameController.text    = category.name!;
          controller.nameArController.text  = category.nameAr!;
          controller.nameFrController.text  = category.nameFr!;
          controller.imageController.text   = category.image!;
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const BigText(text: 'Edit Category'),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.nameController,
                  type: TextInputType.text,
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.nameArController,
                  type: TextInputType.text,
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.nameFrController,
                  type: TextInputType.text,
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: controller.imageController,
                  type: TextInputType.text,
                  bgColor: Theme.of(context).backgroundColor
                ),
                const SizedBox(height: 20),
                CustomButtonAuth(
                  onPressed: (){
                    controller.editCategory(category);
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