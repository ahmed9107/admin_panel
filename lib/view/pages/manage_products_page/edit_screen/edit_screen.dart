import 'package:estore_admin_panel/controllers/manage_products_controller/edit_product_controller.dart';
import 'package:estore_admin_panel/controllers/manage_products_controller/product_controller.dart';
import 'package:estore_admin_panel/models/product_model.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditScreen extends StatelessWidget {
  final ProductData product;
  const EditScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(text: 'Edit Product'),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Get.find<ProductController>().manageProductToggleScreen(0);
          },
          child: Icon(
            EvaIcons.close, color: Theme.of(context).primaryColorLight
          ),
        )
      ),
      body: GetBuilder<EditProductController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomInputField(
                  controller: controller.nameController,
                  type: TextInputType.text,
                  hint: 'Enter product english name',
                  bgColor: Theme.of(context).backgroundColor
                ),
                CustomInputField(
                  controller: controller.nameArController,
                  type: TextInputType.text,
                  hint: 'Enter product arabic name',
                  bgColor: Theme.of(context).backgroundColor
                ),
                CustomInputField(
                  controller: controller.nameFrController,
                  type: TextInputType.text,
                  hint: 'Enter product french name',
                  bgColor: Theme.of(context).backgroundColor
                ),
                CustomInputField(
                  controller: controller.descriptionController,
                  type: TextInputType.text,
                  hint: 'Enter product english description',
                  bgColor: Theme.of(context).backgroundColor
                ),
                CustomInputField(
                  controller: controller.descriptionArController,
                  type: TextInputType.text,
                  hint: 'Enter product arabic description',
                  bgColor: Theme.of(context).backgroundColor
                ),
                CustomInputField(
                  controller: controller.descriptionFrController,
                  type: TextInputType.text,
                  hint: 'Enter product french description',
                  bgColor: Theme.of(context).backgroundColor
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomInputField(
                        controller: controller.priceController,
                        type: TextInputType.text,
                        hint: 'Enter product price',
                        bgColor: Theme.of(context).backgroundColor
                      ),
                    ),
                    Expanded(
                      child: CustomInputField(
                        controller: controller.countController,
                        type: TextInputType.text,
                        hint: 'Enter product count',
                        bgColor: Theme.of(context).backgroundColor
                      ),
                    ),
                    Expanded(
                      child: CustomInputField(
                        controller: controller.discountController,
                        type: TextInputType.text,
                        hint: 'Enter product discount',
                        bgColor: Theme.of(context).backgroundColor
                      ),
                    ),
                  ],
                ),
                /* CustomInputField(
                  controller: controller.imageController,
                  type: TextInputType.text,
                  hint: 'Image',
                  bgColor: Theme.of(context).backgroundColor
                ), */
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: (){
                    controller.editProduct(product);
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