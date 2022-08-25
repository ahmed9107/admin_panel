import 'package:estore_admin_panel/data/api/api_client.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';

class ResetPassRepo{
  final ApiClient apiClient;

  ResetPassRepo({required this.apiClient});

  postData(Map<String, dynamic> data) async {
    var response = await apiClient.postData(AppConstants.RESETPASS_URI, data);
    return response.fold((l) => l, (r) => r);
  }
}