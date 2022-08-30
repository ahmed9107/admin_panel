import 'package:estore_admin_panel/controllers/manage_customers_controllers/customer_controller.dart';
import 'package:estore_admin_panel/data/repository/customer_repo.dart';
import 'package:estore_admin_panel/models/customer_model.dart';
import 'package:estore_admin_panel/models/manage_customer_model.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCustomerController extends GetxController{

  final CustomerRepo customerRepo;
  EditCustomerController({required this.customerRepo});
  
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  final List _data = [];
  List get data => _data;
  StatusRequest statusRequest = StatusRequest.none;

  late ManageCustomerModel model;

  editCustomer(CustomerData customer) async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      if(passwordController.text.isEmpty){
        model = ManageCustomerModel(
          id: customer.id!,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          phone: phoneController.text.trim(),
          password: customer.password!
        );
      } else {
        model = ManageCustomerModel(
          id: customer.id!,
          name: nameController.text.trim(),
          email: emailController.text.trim(),
          phone: phoneController.text.trim(),
          password: passwordController.text.trim(),
        );
      }
      var response = await customerRepo.postData(AppConstants.EDIT_CUSTOMER_DATA_URI, model.toJson());
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
    if (!GetUtils.isEmail(emailController.text.trim()) || emailController.text.trim().isEmpty) {
      errorMsg = 'Enter a valid email';
      update();
      return false;
    }
    if (!GetUtils.isUsername(nameController.text.trim()) ||
      nameController.text.trim().isEmpty ||
      nameController.text.trim().length < 3 ||
      nameController.text.trim().length > 20) {
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (!GetUtils.isPhoneNumber(phoneController.text.trim()) ||
        phoneController.text.trim().isEmpty ||
        phoneController.text.trim().length < 6 ||
        phoneController.text.trim().length > 20) {
      errorMsg = 'Enter a valid Phone number';
      update();
      return false;
    }
    if (passwordController.text.trim().isNotEmpty &&
      passwordController.text.trim().length < 8 ||
      passwordController.text.trim().length > 30) {
      errorMsg = 'Enter a valid password';
      update();
      return false;
    }
    return true;
  }

  @override
  void onInit() {
    nameController       = TextEditingController();
    emailController      = TextEditingController();
    phoneController      = TextEditingController();
    passwordController   = TextEditingController();
    emailController.text = Get.find<CustomerController>().customer!.email!;
    nameController.text  = Get.find<CustomerController>().customer!.name!;
    phoneController.text = Get.find<CustomerController>().customer!.phone!;
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