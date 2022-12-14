import 'package:estore_admin_panel/data/api/api_client.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';

class LoginRepo{
  final ApiClient apiClient;
  /* final SharedPreferences sharedPref; */

  LoginRepo({required this.apiClient/* , required this.sharedPref */});

  postData(String name, String password) async {
    var response = await apiClient.postData(AppConstants.LOGIN_URI, {'name': name, 'password': password});
    return response.fold((l) => l, (r) => r);
  }
}