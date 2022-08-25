// ignore_for_file: constant_identifier_names

class AppConstants {
  /// Auth end points
  static const String BASE_URL                    = 'https://didishoop.com/public/estore_api';
  //static const String BASE_URL                  = 'http://localhost/eStore';
  static const String REGISTRATION_URI            = '/auth/signup.php';
  static const String VERIFY_CODE_URI             = '/auth/verifycode.php';
  static const String LOGIN_URI                   = '/auth/login.php';
  static const String CHECK_EMAIL_URI             = '/forgetPassword/checkEmail.php';
  static const String FORGETPASS_VERIFY_CODE_URI  = '/forgetPassword/verifycode.php';
  static const String RESETPASS_URI               = '/forgetPassword/resetpassword.php';
  static const String PRODUCTS_URI                = '/products/get_products.php';
}