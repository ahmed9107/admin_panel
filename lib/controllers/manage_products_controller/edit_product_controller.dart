import 'dart:io';

import 'package:estore_admin_panel/controllers/manage_products_controller/product_controller.dart';
import 'package:estore_admin_panel/data/repository/product_repo.dart';
import 'package:estore_admin_panel/models/product_model.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProductController extends GetxController{

  final ProductRepo productRepo;
  EditProductController({required this.productRepo});
  
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

  final List _data = [];
  List get data => _data;
  StatusRequest statusRequest = StatusRequest.none;

  late ProductData model;

  editProduct(ProductData product) async {
    if(file == null){
      return Get.snackbar('Faild', 'You have to choose product image!',
        backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
    }
    if (formstate.currentState!.validate()){
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
      );
      var response = await productRepo.postDataWithFile(AppConstants.EDIT_PRODUCT_URI, model.toJson(), file!);
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
    } else {}
  }

  File? file;

  pickImage(ImageSource source) async {
    XFile? xfile = await ImagePicker().pickImage(source: source);
    file = File(xfile!.path);
  }

  @override
  void onInit() {
    nameController                = TextEditingController();
    nameArController              = TextEditingController();
    nameFrController              = TextEditingController();
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
    descriptionController.dispose();
    descriptionArController.dispose();
    descriptionFrController.dispose();
    priceController.dispose();
    countController.dispose();
    discountController.dispose();
    super.dispose();
  }
}