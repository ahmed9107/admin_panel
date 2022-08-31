import 'package:estore_admin_panel/controllers/manage_categories_controller/category_controller.dart';
import 'package:estore_admin_panel/data/repository/category_repo.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryController extends GetxController{

  final CategoryRepo categoryRepo;
  AddCategoryController({required this.categoryRepo});
  
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController nameArController;
  late TextEditingController nameFrController;
  late TextEditingController imageController;

  StatusRequest statusRequest = StatusRequest.none;

  addCategory() async {
    if (formstate.currentState!.validate()) {
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
    } else {}
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