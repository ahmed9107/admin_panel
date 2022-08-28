import 'package:estore_admin_panel/data/api/api_client.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';

class CategoryRepo{
  final ApiClient apiClient;

  CategoryRepo({required this.apiClient});

  getData() async {
    var response = await apiClient.getData(AppConstants.CATEGORIES_DATA_URI);
    return response.fold((l) => l, (r) => r);
  }

  postData(String url, Map data) async {
    var response = await apiClient.postData(url, data);
    return response.fold((l) => l, (r) => r);
  }
}