import 'package:estore_admin_panel/data/api/api_client.dart';

class ProductRepo{
  final ApiClient apiClient;

  ProductRepo({required this.apiClient});

  /* getData() async {
    var response = await apiClient.getData(AppConstants.PRODUCT_DATA_URI);
    return response.fold((l) => l, (r) => r);
  } */

  postData(String url, Map data) async {
    var response = await apiClient.postData(url, data);
    return response.fold((l) => l, (r) => r);
  }
}