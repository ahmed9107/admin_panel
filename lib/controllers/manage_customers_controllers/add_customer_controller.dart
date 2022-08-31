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
  
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  StatusRequest statusRequest = StatusRequest.none;

  addCustomer() async {
    if (formstate.currentState!.validate()){
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
    } else {}
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