import 'package:estore_admin_panel/controllers/manage_categories_controller/category_controller.dart';
import 'package:estore_admin_panel/data/repository/category_repo.dart';
import 'package:estore_admin_panel/models/categories_model.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCategoryController extends GetxController{

  final CategoryRepo categoryRepo;
  EditCategoryController({required this.categoryRepo});
  
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController nameArController;
  late TextEditingController nameFrController;
  late TextEditingController imageController;

  final List _data = [];
  List get data => _data;
  StatusRequest statusRequest = StatusRequest.none;

  late CategoriesData model;

  editCategory(CategoriesData category) async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      model = CategoriesData(
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

  @override
  void onInit() {
    nameController         = TextEditingController();
    nameArController       = TextEditingController();
    nameFrController       = TextEditingController();
    imageController        = TextEditingController();
    nameController.text    = Get.find<CategoryController>().category!.name!;
    nameArController.text  = Get.find<CategoryController>().category!.nameAr!;
    nameFrController.text  = Get.find<CategoryController>().category!.nameFr!;
    imageController.text   = Get.find<CategoryController>().category!.image!;
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