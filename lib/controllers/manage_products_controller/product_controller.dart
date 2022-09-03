import 'package:estore_admin_panel/data/repository/product_repo.dart';
import 'package:estore_admin_panel/models/product_model.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

  final ProductRepo productRepo;
  ProductController({required this.productRepo});
  List<ProductData> _productList = [];
  List<ProductData> get productList => _productList;
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getProductList() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await productRepo.postData(AppConstants.PRODUCT_DATA_URI, {});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        _productList = [];
        _productList.addAll(ProductModel.fromJson(response).data);
        update();
      } else {
        Get.snackbar('Faild', 'Faild to get data!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
    } else {}
  }

  ProductData? productData;
  int currentScreen = 0;

  void manageProductToggleScreen(int index, {ProductData? product}){
    productData = product;
    currentScreen = index;
    update();
  }

  Future<void> deleteProduct(ProductData product) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await productRepo.postData(AppConstants.DELETE_PRODUCT_URI, {'productid': product.id});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        getProductList();
        update();
      } else {
        Get.snackbar('Faild', 'Faild to get data!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
    } else {}
  }
  
  @override
  Future<void> onInit() async {
    await getProductList();
    super.onInit();
  }
}