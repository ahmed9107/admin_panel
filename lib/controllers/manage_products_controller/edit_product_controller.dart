import 'package:estore_admin_panel/controllers/manage_products_controller/product_controller.dart';
import 'package:estore_admin_panel/data/repository/product_repo.dart';
import 'package:estore_admin_panel/models/product_model.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController{

  final ProductRepo productRepo;
  EditProductController({required this.productRepo});
  
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

  final List _data = [];
  List get data => _data;
  StatusRequest statusRequest = StatusRequest.none;

  late ProductData model;

  editProduct(ProductData product) async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      model = ProductData(
        id            : product.id,
        name          : nameController.text.trim(),
        nameAr        : nameArController.text.trim(),
        nameFr        : nameFrController.text.trim(),
        description   : descriptionController.text.trim(),
        descriptionAr : descriptionArController.text.trim(),
        descriptionFr : descriptionFrController.text.trim(),
        price         : descriptionFrController.text.trim(),
        count         : descriptionFrController.text.trim(),
        discount      : descriptionFrController.text.trim(),
        image         : imageController.text.trim(),
      );
      var response = await productRepo.postData(AppConstants.EDIT_PRODUCT_URI, model.toJson());
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          Get.find<ProductController>().getProductList();
          Get.find<ProductController>().manageProductToggleScreen(0);
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
    if (imageController.text.trim().isEmpty) {
      errorMsg = 'Enter a valid image';
      update();
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    nameController                = TextEditingController();
    nameArController              = TextEditingController();
    nameFrController              = TextEditingController();
    imageController               = TextEditingController();
    descriptionController         = TextEditingController();
    descriptionArController       = TextEditingController();
    descriptionFrController       = TextEditingController();
    priceController               = TextEditingController();
    countController               = TextEditingController();
    discountController            = TextEditingController();
    nameController.text           = Get.find<ProductController>().productData!.name!;
    nameArController.text         = Get.find<ProductController>().productData!.nameAr??'';
    nameFrController.text         = Get.find<ProductController>().productData!.nameFr??'';
    descriptionController.text    = Get.find<ProductController>().productData!.description!;
    descriptionArController.text  = Get.find<ProductController>().productData!.descriptionAr??'';
    descriptionFrController.text  = Get.find<ProductController>().productData!.descriptionFr??'';
    priceController.text          = Get.find<ProductController>().productData!.price!;
    countController.text          = Get.find<ProductController>().productData!.count!;
    discountController.text       = Get.find<ProductController>().productData!.discount!;
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