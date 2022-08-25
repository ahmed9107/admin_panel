import 'package:estore_admin_panel/data/api/api_client.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';

class CheckEmailRepo{
  final ApiClient apiClient;

  CheckEmailRepo({required this.apiClient});

  postData(String email) async {
    var response = await apiClient.postData(AppConstants.CHECK_EMAIL_URI, {'email': email});
    return response.fold((l) => l, (r) => r);
  }
}