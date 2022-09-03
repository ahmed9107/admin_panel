import 'package:estore_admin_panel/controllers/manage_categories_controller/add_category_controller.dart';
import 'package:estore_admin_panel/controllers/manage_categories_controller/category_controller.dart';
import 'package:estore_admin_panel/utils/functions/input_validator.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

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
            child: SingleChildScrollView(
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
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        controller.file != null 
                          ? Stack(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFF9B9B9B)),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Image.file(controller.file!),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.deleteImage();
                                  },
                                  icon: const Icon(Icons.cancel, color: Colors.white),
                                ),
                              ],
                            )
                          : Container(),
                        InkWell(
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
                                      Get.back();
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
                                      Get.back();
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
                      ],
                    ),
                  ),
                  CustomButton(
                    onPressed: (){
                      controller.addCategory();
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