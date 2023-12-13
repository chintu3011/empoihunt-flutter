class APIEndPoint{

  APIEndPoint._();

  static const String baseUrl= 'https://api.emploihunt.com/api';

  static const String privacyPolicy = "/terms-privacy-policy/get_terms_policy_by_id?id=1";
  static const String  termsAndCondition = '/terms-privacy-policy/get_terms_policy_by_id?id=2';
  static const String  getLatestAppVersionCode = '/update_app/get_latest_app_version_code';
  static const String  getLocationsList = '/city/cities';
  static const String  splashUpdateApp = '/update_app/get_latest_app_version_code?iUserId=0';
  static const String  checkUserExisting = '/signin/check_user_existing?mobile=%2B';
  static const String  loginApi = '/signin/login';
  static const String  registerUserApi = '/signin/register_user';


  ///------------------------------------- job seeker ------------------------------///

  static const String  jobPostApi = '/job/jobs?iJobPreferenceId=';
  static const String  jobAppliedApi = '/job/apply?jobId=';
  static const String  saveJobApi = '/job/save?jobId=';
  static const String  unSaveJobApi = '/job/unSave?jobId=';

  static const String  campusPlacementApi = '/campus_placement/campus?';
  static const String  campusPlacementAppliedApi = '/campus_placement/apply?campusId=';


  static const String  saveListApi = '/job/saveList?';
  static const String  appliedListApi = '/job/applyList?';

  static const String  contactUsApi = '/contact-us/insert_user_contact';


  static const String  jobPreferenceApi = '/jobPreference/jobPreference';
  static const String  jobPreferenceInsertApi = '/jobPreference/insert_preference';
  static const String  jobPreferenceUpdateApi = '/jobPreference/update_preference';

///------------------------------------- job seeker ------------------------------///

///------------------------------------- Profile --------------------------------///
    static const String userExperienceApi = '/experince/experince';
    static const String userExperienceInsertApi = '/experince/insert_experince';
    static const String userExperienceUpdateApi = '/experince/update_experince';
    static const String userExperienceDeleteApi = '/experince/delete_experince';
    static const String userUpdateProfileDetailsApi = '/user/update_profile_details';
    static const String userUpdateBannerPicApi = '/user/update_banner_pic';
    static const String userUpdateProfilePicApi = '/user/update_profile_pic';
    static const String userUpdateResumeApi = '/user/update_resume';
///------------------------------------- Profile --------------------------------///
}