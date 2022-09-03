import 'dart:io';

import 'package:estore_admin_panel/data/api/api_client.dart';

class CategoryRepo{
  final ApiClient apiClient;

  CategoryRepo({required this.apiClient});

  postData(String url, Map data) async {
    //var response = await apiClient.postData(AppConstants.CATEGORIES_DATA_URI, {});
    var response = await apiClient.postData(url, data);
    return response.fold((l) => l, (r) => r);
  }

  postDataWithFile(String url, Map data, File file) async {
    var response = await apiClient.postDataWithFile(url, data, file);
    return response.fold((l) => l, (r) => r);
  }
}