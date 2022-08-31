import 'package:estore_admin_panel/controllers/manage_categories_controller/add_category_controller.dart';
import 'package:estore_admin_panel/controllers/manage_categories_controller/category_controller.dart';
import 'package:estore_admin_panel/utils/functions/input_validator.dart';
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
        title: const BigText(text: 'Add Category'),
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
      body: GetBuilder<AddCategoryController>(
        builder: (controller) {
          return Form(
            key: controller.formstate,
            child: Column(
              children: [
                CustomInputField(
                  controller: controller.nameController,
                  type: TextInputType.text,
                  hint: 'Enter category english name',
                  bgColor: Theme.of(context).backgroundColor,
                  title: 'English name',
                  validate: (val){
                    return inputValidator(val!, 4, 20, null);
                  }
                ),
                CustomInputField(
                  controller: controller.nameArController,
                  type: TextInputType.text,
                  hint: 'Enter category arabic name',
                  bgColor: Theme.of(context).backgroundColor,
                  title: 'Arabic name',
                  validate: (val){
                    return inputValidator(val!, 4, 20, null);
                  }
                ),
                CustomInputField(
                  controller: controller.nameFrController,
                  type: TextInputType.text,
                  hint: 'Enter category french name',
                  bgColor: Theme.of(context).backgroundColor,
                  title: 'French name',
                  validate: (val){
                    return inputValidator(val!, 4, 20, null);
                  }
                ),
                /* CustomInputField(
                  controller: controller.imageController,
                  type: TextInputType.text,
                  hint: 'Image',
                  bgColor: Theme.of(context).backgroundColor,
                  title: 'Password',

                ), */
                CustomButton(
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