import 'package:estore_admin_panel/data/api/api_client.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';

class ForgetPassVerifyRepo{
  final ApiClient apiClient;

  ForgetPassVerifyRepo({required this.apiClient});

  postData(Map<String, dynamic> data) async {
    var response = await apiClient.postData(AppConstants.FORGETPASS_VERIFY_CODE_URI, data);
    return response.fold((l) => l, (r) => r);
  }
}