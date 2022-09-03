import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:estore_admin_panel/utils/constants/app_constants.dart';
import 'package:estore_admin_panel/utils/constants/status-request.dart';
import 'package:estore_admin_panel/utils/functions/check_connection.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

String _basicAuth = 'Basic${base64Encode(utf8.encode('u314730127_Az:@ZamiLemarshalS0tA'))}';

Map<String, String> headers = {
  'authorization': _basicAuth
};

class ApiClient{

  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try {
      if(await checkConnection()){
        http.Response response = await http.post(Uri.parse(AppConstants.BASE_URL + url), body: data, headers: headers);
        if(response.statusCode == 200 || response.statusCode == 201){
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }
  
  Future<Either<StatusRequest, Map>> postDataWithFile(String url, Map data, File file) async {
    try {
      if(await checkConnection()){
        var request = http.MultipartRequest('POST', Uri.parse(AppConstants.BASE_URL + url));
        var length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multiPartFile = http.MultipartFile('image', stream, length, filename: basename(file.path));
        request.files.add(multiPartFile);
        data.forEach((key, value) {
          request.fields[key] = value;
        });
        var myRequest = await request.send();
        var response = await http.Response.fromStream(myRequest);
        if(response.statusCode == 200 || response.statusCode == 201){
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print('ERROR FROM POST DATA WITH FILE => $e');
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getData(String url) async {
    try {
      if(await checkConnection()){
        http.Response response = await http.get(Uri.parse(AppConstants.BASE_URL + url), headers: headers);
        if(response.statusCode == 200 || response.statusCode == 201){
          var responseBody = jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverFailure);
    }
  }


}