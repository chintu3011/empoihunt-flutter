class APIEndPoint{

  APIEndPoint._();

  static const String baseUrl= 'https://api.emploihunt.com/api';
  // static const String baseUrl= "https://dummyjson.com/";

  static const String privacyPolicy = "/terms-privacy-policy/get_terms_policy_by_id?id=1";
  static const String  termsAndCondition = '/terms-privacy-policy/get_terms_policy_by_id?id=2';
  static const String  GET_LATEST_APP_VERSION_CODE = '/update_app/get_latest_app_version_code';
}