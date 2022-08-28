import 'package:estore_admin_panel/controllers/category_controller.dart';
import 'package:estore_admin_panel/data/repository/category_repo.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryController extends GetxController{

  final CategoryRepo categoryRepo;
  AddCategoryController({required this.categoryRepo});
  
  late TextEditingController nameController;
  late TextEditingController nameArController;
  late TextEditingController nameFrController;
  late TextEditingController imageController;

  StatusRequest statusRequest = StatusRequest.none;

  addCategory() async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      Map<String, dynamic> data = {
        'name'      : nameController.text.trim(),
        'name_ar'   : nameArController.text.trim(),
        'name_fr'   : nameFrController.text.trim(),
        'image'     : imageController.text.trim(),
      };
      var response = await categoryRepo.postData(AppConstants.ADD_CATEGORY_URI, data);
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
        Get.snackbar('Faild', '404!!!',
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
      nameController.text.trim().length > 20){
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (nameArController.text.trim().isEmpty ||
      nameArController.text.trim().length < 3 ||
      nameArController.text.trim().length > 20){
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (nameFrController.text.trim().isEmpty ||
      nameFrController.text.trim().length < 3 ||
      nameFrController.text.trim().length > 20){
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (imageController.text.trim().isEmpty){
      errorMsg = 'Enter a valid Phone number';
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