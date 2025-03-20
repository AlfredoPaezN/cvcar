// ignore_for_file: constant_identifier_names

abstract class ApiRoutes {
  static const PROD_BASE_URL = 'https://prod.cvcar.com.co$API_PATH';

  // static const PROD_BASE_URL = 'https://testing.cvcar.com.co$API_PATH';
  static const API_PATH = '/api/v1/';
  static const LOGIN_PATH = 'users/login';
  static const USER = 'users/';
  static const USER_PROFILE_PHOTO = 'files';
  static const USER_PERMISSION = 'user/claims';
  static const USER_MANAGEMENT = 'users_management/';
  static const REGISTER_VEHICLE = 'vehicles/';
  static const EMAIL_FORGOT_PASS = 'sendEmailForgetPassword/';
}
