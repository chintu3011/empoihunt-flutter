class APIEndPoint{

  APIEndPoint._();

  static const String baseUrl= 'https://api.emploihunt.com/api';

  static const String privacyPolicy = "/terms-privacy-policy/get_terms_policy_by_id?id=1";
  static const String  termsAndCondition = '/terms-privacy-policy/get_terms_policy_by_id?id=2';
  static const String  getLatestAppVersionCode = '/update_app/get_latest_app_version_code';
  static const String  getLocationsList = '/city/cities';
  static const String  splashUpdateApp = '/update_app/get_latest_app_version_code?iUserId=0';
  static const String  checkUserExisting = '/signin/check_user_existing?mobile=%2B';
}