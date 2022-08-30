import 'package:estore_admin_panel/data/repository/category_repo.dart';
import 'package:estore_admin_panel/models/categories_model.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

  final CategoryRepo categoryRepo;
  CategoryController({required this.categoryRepo});
  List<CategoriesData> _categoryList = [];
  List<CategoriesData> get categoryList => _categoryList;
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getCategoryList() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryRepo.postData(AppConstants.CATEGORIES_DATA_URI, {});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        _categoryList = [];
        _categoryList.addAll(CategoryModel.fromJson(response).categoryData);
        update();
      } else {
        Get.snackbar('Faild', 'Faild to get data!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
    } else {}
  }

  CategoriesData? category;
  int currentScreen = 0;

  void manageCategoryToggleScreen(int index, {CategoriesData? categoryData}){
    currentScreen = index;
    category = categoryData;
    update();
  }

  Future<void> deleteCategory(CategoriesData categoryData) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryRepo.postData(AppConstants.DELETE_CATEGORY_URI, {'categoryid': categoryData.id});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        getCategoryList();
        update();
      } else {
        Get.snackbar('Faild', 'Faild to get data!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
    } else {}
  }
  
  @override
  void onInit() {
    getCategoryList();
    super.onInit();
  }
}