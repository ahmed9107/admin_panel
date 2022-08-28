import 'package:estore_admin_panel/data/repository/customer_repo.dart';
import 'package:estore_admin_panel/models/customer_model.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController{

  final CustomerRepo customerRepo;
  CustomerController({required this.customerRepo});
  List<CustomerData> _customerList = [];
  List<CustomerData> get customerList => _customerList;
  StatusRequest statusRequest = StatusRequest.none;

  Future<void> getCustomersList() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await customerRepo.getData();
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        _customerList = [];
        _customerList.addAll(CustomerModel.fromJson(response).customerData);
        update();
      } else {
        Get.snackbar('Faild', 'Faild to get data!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
    } else {}
  }

  CustomerData? customer;
  int currentScreen = 0;

  void manageCustomerToggleScreen(int index, {CustomerData? customerData}){
    currentScreen = index;
    customer = customerData;
    update();
  }

  Future<void> deleteCustomer(CustomerData customerData) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await customerRepo.postData(AppConstants.DELETE_CUSTOMER_URI, {'userid': customerData.id});
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if(response['status'] == 'success'){
        getCustomersList();
        update();
      } else {
        Get.snackbar('Faild', 'Faild to get data!',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
    } else {}
  }
  
  @override
  void onInit() {
    getCustomersList();
    super.onInit();
  }
}