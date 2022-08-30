import 'package:estore_admin_panel/controllers/manage_categories_controller/category_controller.dart';
import 'package:estore_admin_panel/controllers/manage_categories_controller/edit_category_controller.dart';
import 'package:estore_admin_panel/models/categories_model.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  final CategoriesData category;
  const EditScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(text: 'Edit Category'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.find<CategoryController>().manageCategoryToggleScreen(0);
          },
          child: Icon(
            EvaIcons.close, color: Theme.of(context).primaryColorLight
          ),
        )
      ),
      body: GetBuilder<EditCategoryController>(
        builder: (controller) {
          return Column(
            children: [
              CustomInputField(
                controller: controller.nameController,
                type: TextInputType.text,
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomInputField(
                controller: controller.nameArController,
                type: TextInputType.text,
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomInputField(
                controller: controller.nameFrController,
                type: TextInputType.text,
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomInputField(
                controller: controller.imageController,
                type: TextInputType.text,
                bgColor: Theme.of(context).backgroundColor
              ),
              CustomButton(
                onPressed: (){
                  controller.editCategory(category);
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