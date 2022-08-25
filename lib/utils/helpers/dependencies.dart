import 'package:estore_admin_panel/controllers/auth_controllers/edit_profile_controller.dart';
import 'package:estore_admin_panel/controllers/auth_controllers/login_controller.dart';
import 'package:estore_admin_panel/controllers/layout_controller.dart';
import 'package:estore_admin_panel/data/api/api_client.dart';
import 'package:estore_admin_panel/data/repository/auth/forgetpass_verify_repo.dart';
import 'package:estore_admin_panel/data/repository/auth/login_repo.dart';
import 'package:estore_admin_panel/data/repository/auth/resetpass_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import '../../data/repository/auth/check_email_repo.dart';

class InitialBindings extends Bindings{
  @override
  Future<void> dependencies() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPrefs, fenix: true);
    
    // ApiClient
    Get.lazyPut(() => ApiClient(), fenix: true);

    // Repository
    Get.lazyPut(() => LoginRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => CheckEmailRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ForgetPassVerifyRepo(apiClient: Get.find()), fenix: true);
    Get.lazyPut(() => ResetPassRepo(apiClient: Get.find()), fenix: true);

    // Controllers
    Get.lazyPut(() => EditProfileController(), fenix: true);
    Get.lazyPut(() => LayoutController(), fenix: true);
    Get.lazyPut(() => LoginController(loginRepo: Get.find()), fenix: true);
  }
}