import 'dart:io';

/* checkConnection() async {
  try {
    final result = await http.get(Uri.parse('www.google.com'));
    if(result.statusCode==200){
        return true;
      }
    else{
        return false;
    }
  } on SocketException catch (_) {
    return false;
  }
} */

checkConnection() async {
  try {
    var result = await InternetAddress.lookup("google.com");
    if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
}