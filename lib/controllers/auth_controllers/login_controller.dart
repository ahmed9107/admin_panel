import 'package:estore_admin_panel/data/repository/auth/login_repo.dart';
import 'package:estore_admin_panel/routes/app_routes.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepo loginRepo;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  LoginController({required this.loginRepo});

  bool _nameError = false;
  bool get nameError => _nameError;
  
  bool _emptyError = false;
  bool get emptyError => _emptyError;
  
  StatusRequest statusRequest = StatusRequest.none;

  login() async {
    if(fieldValidat()){
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginRepo.postData(nameController.text.trim(), passwordController.text.trim());
      statusRequest = handlingData(response);
      if(statusRequest == StatusRequest.success){
        if(response['status'] == 'success'){
          Get.offAllNamed(AppRoute.getInitial());
        } else {
          Get.snackbar('Faild', 'The email or password not correct!',
            backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
        }
      } else {
        Get.snackbar('Faild', '$statusRequest',
          backgroundColor: Colors.red.withOpacity(0.5), colorText: Colors.white);
      }
      update();
    }
  }

  String errorMsg = '';

  bool fieldValidat(){
    if (!GetUtils.isUsername(nameController.text.trim())) {
      _nameError = false;
      errorMsg = 'Enter a valid name';
      update();
      return false;
    }
    if (nameController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      _nameError = false;
      _emptyError = true;
      errorMsg = 'Enter your password';
      update();
      return false;
    }
    return true;
  }

  bool isHidePassword = true;

  showPassword(){
    isHidePassword = !isHidePassword;
    update();
  }

  @override
  void onInit() {
    nameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
