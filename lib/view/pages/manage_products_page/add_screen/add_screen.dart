import 'package:estore_admin_panel/controllers/manage_products_controller/add_product_controller.dart';
import 'package:estore_admin_panel/controllers/manage_products_controller/product_controller.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../utils/functions/input_validator.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BigText(text: 'Add Product'),
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
      body: GetBuilder<AddProductController>(
        builder: (controller) {
          return Form(
            key: controller.formstate,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputField(
                    controller: controller.nameController,
                    type: TextInputType.text,
                    hint: 'Enter product english name',
                    bgColor: Theme.of(context).backgroundColor,
                    title: 'English name',
                    validate: (val){
                      return inputValidator(val!, 4, 20, null);
                    }
                  ),
                  CustomInputField(
                    controller: controller.nameArController,
                    type: TextInputType.text,
                    hint: 'Enter product arabic name',
                    bgColor: Theme.of(context).backgroundColor,
                    title: 'Arabic name',
                    validate: (val){return inputValidator(val!, 4, 20, null);}
                  ),
                  CustomInputField(
                    controller: controller.nameFrController,
                    type: TextInputType.text,
                    hint: 'Enter product french name',
                    bgColor: Theme.of(context).backgroundColor,
                    title: 'French name',
                    validate: (val){return inputValidator(val!, 4, 20, null);}
                  ),
                  CustomInputField(
                    controller: controller.descriptionController,
                    type: TextInputType.text,
                    hint: 'Enter product english description',
                    bgColor: Theme.of(context).backgroundColor,
                    title: 'English description',
                    validate: (val){return inputValidator(val!, 10, 550, null);}
                  ),
                  CustomInputField(
                    controller: controller.descriptionArController,
                    type: TextInputType.text,
                    hint: 'Enter product arabic description',
                    bgColor: Theme.of(context).backgroundColor,
                    title: 'Arabic description',
                    validate: (val){return inputValidator(val!, 10, 550, null);}
                  ),
                  CustomInputField(
                    controller: controller.descriptionFrController,
                    type: TextInputType.text,
                    hint: 'Enter product french description',
                    bgColor: Theme.of(context).backgroundColor,
                    title: 'French description',
                    validate: (val){return inputValidator(val!, 10, 550, null);}
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomInputField(
                          controller: controller.priceController,
                          type: TextInputType.text,
                          hint: 'Enter product price',
                          bgColor: Theme.of(context).backgroundColor,
                          title: 'Price',
                          validate: (val){return inputValidator(val!, 1, 5, null);}
                        ),
                      ),
                      Expanded(
                        child: CustomInputField(
                          controller: controller.countController,
                          type: TextInputType.text,
                          hint: 'Enter product count',
                          bgColor: Theme.of(context).backgroundColor,
                          title: 'Count',
                          validate: (val){return inputValidator(val!, 1, 5, null);}
                        ),
                      ),
                      Expanded(
                        child: CustomInputField(
                          controller: controller.discountController,
                          type: TextInputType.text,
                          hint: 'Enter product discount',
                          bgColor: Theme.of(context).backgroundColor,
                          title: 'Discount',
                          validate: (val){return inputValidator(val!, 0, 2, null);}
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: InkWell(
                      onTap: (){
                        Get.defaultDialog(
                          title: 'Choose image',
                          titleStyle: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: ()async{
                                  await controller.pickImage(ImageSource.gallery);
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFF9B9B9B)),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      EvaIcons.imageOutline, color:Color(0xFF9B9B9B)
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: ()async{
                                  await controller.pickImage(ImageSource.camera);
                                },
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFF9B9B9B)),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      EvaIcons.cameraOutline, color:Color(0xFF9B9B9B)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          radius: 5,
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF9B9B9B)),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Center(
                          child: Icon(
                            EvaIcons.cameraOutline, color:Color(0xFF9B9B9B)
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: (){
                      controller.addProduct;
                    },
                    text: 'Submit',
                  ),
                ],
              ),
            ),
          );
        }
      )
    );
  }
}