import 'package:estore_admin_panel/controllers/manage_products_controller/product_controller.dart';
import 'package:estore_admin_panel/data/repository/product_repo.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController{

  final ProductRepo productRepo;
  AddProductController({required this.productRepo});
  
  late TextEditingController nameController;
  late TextEditingController nameArController;
  late TextEditingController nameFrController;
  late TextEditingController imageController;
  late TextEditingController descriptionController;
  late TextEditingController descriptionArController;
  late TextEditingController descriptionFrController;
  late TextEditingController priceController;
  late TextEditingController countController;
  late TextEditingController discountController;

  StatusRequest statusRequest = StatusRequest.none;

  addProduct() async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      Map<String, dynamic> data = {
        'name'      : nameController.text.trim(),
        'name_ar'   : nameArController.text.trim(),
        'name_fr'   : nameFrController.text.trim(),
        'image'     : imageController.text.trim(),
        'desc'      : descriptionController.text.trim(),
        'desc_ar'   : descriptionArController.text.trim(),
        'desc_fr'   : descriptionFrController.text.trim(),
        'price'     : priceController.text.trim(),
        'count'     : countController.text.trim(),
        'discount'  : discountController.text.trim(),
      };
      var response = await productRepo.postData(AppConstants.ADD_PRODUCT_URI, data);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          Get.find<ProductController>().getProductList;
          Get.find<ProductController>().manageProductToggleScreen(0);
        }else{
          Get.snackbar('Faild', '123',
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
      nameController.text.trim().length < 3){
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (nameArController.text.trim().isEmpty ||
      nameArController.text.trim().length < 3){
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (nameFrController.text.trim().isEmpty ||
      nameFrController.text.trim().length < 3){
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
    nameController          = TextEditingController();
    nameArController        = TextEditingController();
    nameFrController        = TextEditingController();
    imageController         = TextEditingController();
    descriptionController   = TextEditingController();
    descriptionArController = TextEditingController();
    descriptionFrController = TextEditingController();
    priceController         = TextEditingController();
    countController         = TextEditingController();
    discountController      = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    nameArController.dispose();
    nameFrController.dispose();
    imageController.dispose();
    descriptionController.dispose();
    descriptionArController.dispose();
    descriptionFrController.dispose();
    priceController.dispose();
    countController.dispose();
    discountController.dispose();
    super.dispose();
  }
}