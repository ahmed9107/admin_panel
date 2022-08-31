import 'package:estore_admin_panel/data/repository/auth/login_repo.dart';
import 'package:estore_admin_panel/routes/app_routes.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepo loginRepo;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController passwordController;
  LoginController({required this.loginRepo});
  
  StatusRequest statusRequest = StatusRequest.none;

  login() async {
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
