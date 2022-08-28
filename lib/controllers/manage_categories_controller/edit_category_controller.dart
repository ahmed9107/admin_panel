import 'package:estore_admin_panel/controllers/Category_controller.dart';
import 'package:estore_admin_panel/data/repository/category_repo.dart';
import 'package:estore_admin_panel/data/repository/Category_repo.dart';
import 'package:estore_admin_panel/models/Category_model.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategoryController extends GetxController{

  final CategoryRepo categoryRepo;
  EditCategoryController({required this.categoryRepo});
  
  late TextEditingController nameController;
  late TextEditingController nameArController;
  late TextEditingController nameFrController;
  late TextEditingController imageController;

  final List _data = [];
  List get data => _data;
  StatusRequest statusRequest = StatusRequest.none;

  late CategoryData model;

  editCategory(CategoryData category) async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      model = CategoryData(
        id:     category.id,
        name:   nameController.text.trim(),
        nameAr: nameArController.text.trim(),
        nameFr: nameFrController.text.trim(),
        image:  imageController.text.trim(),
      );
      var response = await categoryRepo.postData(AppConstants.EDIT_CATEGORY_URI, model.toJson());
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          Get.find<CategoryController>().getCategoryList();
          Get.find<CategoryController>().manageCategoryToggleScreen(0);
        }else{
          Get.snackbar('Faild', 'Phone number or email is already exist',
            backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
        }
      }else{
        Get.snackbar('Faild', 'Phone number or email is already exist',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
      update();
    } else {
      Get.snackbar('Faild', errorMsg,
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
  }

  String errorMsg = '';

  bool fieldValidat(){
    if (nameController.text.trim().isEmpty ||
      nameController.text.trim().length < 3 ||
      nameController.text.trim().length > 20) {
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (nameFrController.text.trim().isEmpty ||
      nameFrController.text.trim().length < 3 ||
      nameFrController.text.trim().length > 20) {
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (nameArController.text.trim().isEmpty ||
        nameArController.text.trim().length < 3 ||
        nameArController.text.trim().length > 20) {
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (imageController.text.trim().isEmpty ||
      imageController.text.trim().length < 8 ||
      imageController.text.trim().length > 30) {
      errorMsg = 'Enter a valid image';
      update();
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    nameController    = TextEditingController();
    nameArController  = TextEditingController();
    nameFrController  = TextEditingController();
    imageController   = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    nameArController.dispose();
    nameFrController.dispose();
    imageController.dispose();
    super.dispose();
  }
}