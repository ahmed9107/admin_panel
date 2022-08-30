import 'package:estore_admin_panel/data/api/api_client.dart';

class CustomerRepo{
  final ApiClient apiClient;

  CustomerRepo({required this.apiClient});

  /* getData() async {
    var response = await apiClient.getData(AppConstants.CUSTOMER_DATA_URI);
    return response.fold((l) => l, (r) => r);
  } */

  postData(String url, Map data) async {
    var response = await apiClient.postData(url, data);
    return response.fold((l) => l, (r) => r);
  }
}