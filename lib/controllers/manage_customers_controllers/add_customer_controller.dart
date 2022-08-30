import 'package:estore_admin_panel/controllers/manage_customers_controllers/customer_controller.dart';
import 'package:estore_admin_panel/data/repository/customer_repo.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomerController extends GetxController{

  final CustomerRepo customerRepo;
  AddCustomerController({required this.customerRepo});
  
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  StatusRequest statusRequest = StatusRequest.none;

  addCustomer() async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      Map<String, dynamic> data = {
        'name'    : nameController.text.trim(),
        'email'   : emailController.text.trim(),
        'phone'   : phoneController.text.trim(),
        'password': passwordController.text.trim(),
      };
      var response = await customerRepo.postData(AppConstants.ADD_CUSTOMER_URI, data);
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          Get.find<CustomerController>().getCustomersList();
          Get.find<CustomerController>().manageCustomerToggleScreen(0);
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
    if (!GetUtils.isEmail(emailController.text.trim()) || emailController.text.trim().isEmpty){
      errorMsg = 'Enter a valid email';
      update();
      return false;
    }
    if (!GetUtils.isUsername(nameController.text.trim()) ||
      nameController.text.trim().isEmpty ||
      nameController.text.trim().length < 3 ||
      nameController.text.trim().length > 20){
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (!GetUtils.isPhoneNumber(phoneController.text.trim()) ||
      phoneController.text.trim().isEmpty ||
      phoneController.text.trim().length < 6 ||
      phoneController.text.trim().length > 20){
      errorMsg = 'Enter a valid Phone number';
      update();
      return false;
    }
    if (passwordController.text.trim().isEmpty ||
      passwordController.text.trim().length < 8 ||
      passwordController.text.trim().length > 30){
      errorMsg = 'Enter a valid password';
      update();
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    nameController      = TextEditingController();
    emailController     = TextEditingController();
    phoneController     = TextEditingController();
    passwordController  = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}