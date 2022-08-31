import 'dart:io';

import 'package:estore_admin_panel/controllers/manage_products_controller/product_controller.dart';
import 'package:estore_admin_panel/data/repository/product_repo.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProductController extends GetxController{

  final ProductRepo productRepo;
  AddProductController({required this.productRepo});

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController nameArController;
  late TextEditingController nameFrController;
  late TextEditingController descriptionController;
  late TextEditingController descriptionArController;
  late TextEditingController descriptionFrController;
  late TextEditingController priceController;
  late TextEditingController countController;
  late TextEditingController discountController;

  StatusRequest statusRequest = StatusRequest.none;

  addProduct() async {
    if (formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update();
      Map<String, dynamic> data = {
        'name'      : nameController.text.trim(),
        'name_ar'   : nameArController.text.trim(),
        'name_fr'   : nameFrController.text.trim(),
        'desc'      : descriptionController.text.trim(),
        'desc_ar'   : descriptionArController.text.trim(),
        'desc_fr'   : descriptionFrController.text.trim(),
        'price'     : priceController.text.trim(),
        'count'     : countController.text.trim(),
        'discount'  : discountController.text.trim(),
        'image'     : '',
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
    } else {}
  }

  File? file;

  pickImage(ImageSource source) async {
    XFile? xfile = await ImagePicker().pickImage(source: source);
    file = File(xfile!.path);
  }

  @override
  void onInit() {
    nameController          = TextEditingController();
    nameArController        = TextEditingController();
    nameFrController        = TextEditingController();
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
    descriptionController.dispose();
    descriptionArController.dispose();
    descriptionFrController.dispose();
    priceController.dispose();
    countController.dispose();
    discountController.dispose();
    super.dispose();
  }
}