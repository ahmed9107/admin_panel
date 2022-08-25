import 'package:estore_admin_panel/utils/constants/status-request.dart';

handlingData(response){
  if(response is StatusRequest){
    return response;
  }else{
    return StatusRequest.success;
  }
}