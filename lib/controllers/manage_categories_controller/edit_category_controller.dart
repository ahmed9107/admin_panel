import 'dart:io';

import 'package:estore_admin_panel/controllers/manage_categories_controller/category_controller.dart';
import 'package:estore_admin_panel/data/repository/category_repo.dart';
import 'package:estore_admin_panel/models/categories_model.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditCategoryController extends GetxController{

  final CategoryRepo categoryRepo;
  EditCategoryController({required this.categoryRepo});
  
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController nameArController;
  late TextEditingController nameFrController;

  final List _data = [];
  List get data => _data;
  StatusRequest statusRequest = StatusRequest.none;

  late CategoriesData model;

  editCategory(CategoriesData category) async {
    if(file == null){
      return Get.snackbar('Faild', 'You have to choose category image!',
        backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      model = CategoriesData(
        id:     category.id,
        name:   nameController.text.trim(),
        nameAr: nameArController.text.trim(),
        nameFr: nameFrController.text.trim(),
      );
      var response = await categoryRepo.postDataWithFile(AppConstants.EDIT_CATEGORY_URI, model.toJson(), file!);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          Get.find<CategoryController>().getCategoryList();
          Get.find<CategoryController>().manageCategoryToggleScreen(0);
        }else{
          Get.snackbar('Faild', response['status'],
            backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
        }
      }else{
        Get.snackbar('Faild', 'FROM FAILD§§§§',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
      update();
    } else {}
  }

  File? file;

  pickImage(ImageSource source) async {
    XFile? xfile = await ImagePicker().pickImage(source: source);
    file = File(xfile!.path);
  }

  @override
  void onInit() {
    nameController         = TextEditingController();
    nameArController       = TextEditingController();
    nameFrController       = TextEditingController();
    nameController.text    = Get.find<CategoryController>().category!.name!;
    nameArController.text  = Get.find<CategoryController>().category!.nameAr!;
    nameFrController.text  = Get.find<CategoryController>().category!.nameFr!;
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    nameArController.dispose();
    nameFrController.dispose();
    super.dispose();
  }
}