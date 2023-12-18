class AppliedUserModel {
  final int? id;
  final int? iUserId;
  final int? iJobId;
  final String? tCreatedAt;
  final String? tUpadatedAt;
  final UserJobPrefModel? userJobPref;

  AppliedUserModel({
    this.id,
    this.iUserId,
    this.iJobId,
    this.tCreatedAt,
    this.tUpadatedAt,
    this.userJobPref,
  });

  factory AppliedUserModel.fromJson(Map<String, dynamic> json) {
    return AppliedUserModel(
      id: json['id'],
      iUserId: json['iUserId'],
      iJobId: json['iJobId'],
      tCreatedAt: json['tCreatedAt'],
      tUpadatedAt: json['tUpadatedAt'],
      userJobPref: json['userJobPref'] != null
          ? UserJobPrefModel.fromJson(json['userJobPref'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['iUserId'] = iUserId;
    data['iJobId'] = iJobId;
    data['tCreatedAt'] = tCreatedAt;
    data['tUpadatedAt'] = tUpadatedAt;
    data['userJobPref'] = userJobPref?.toJson();
    return data;
  }
}

class UserJobPrefModel {
  final int? id;
  final String? vFirebaseId;
  final int? iRole;
  final String? vFirstName;
  final String? vLastName;
  final String? vMobile;
  final String? vEmail;
  final String? tProfileUrl;
  final String? tProfileBannerUrl;
  final String? tResumeUrl;
  final String? vCity;
  final String? tBio;
  final String? vCurrentCompany;
  final String? vDesignation;
  final String? vJobLocation;
  final dynamic vDuration;
  final String? vPreferCity;
  final String? vPreferJobTitle;
  final String? vQualification;
  final String? vWorkingMode;
  final String? tTagLine;
  final dynamic googleid;
  final dynamic fbid;
  final int? isBlock;
  final int? isLogin;
  final String? tCreatedAt;
  final String? tUpadatedAt;
  final List<dynamic>? jobPreference;

  UserJobPrefModel({
    this.id,
    this.vFirebaseId,
    this.iRole,
    this.vFirstName,
    this.vLastName,
    this.vMobile,
    this.vEmail,
    this.tProfileUrl,
    this.tProfileBannerUrl,
    this.tResumeUrl,
    this.vCity,
    this.tBio,
    this.vCurrentCompany,
    this.vDesignation,
    this.vJobLocation,
    this.vDuration,
    this.vPreferCity,
    this.vPreferJobTitle,
    this.vQualification,
    this.vWorkingMode,
    this.tTagLine,
    this.googleid,
    this.fbid,
    this.isBlock,
    this.isLogin,
    this.tCreatedAt,
    this.tUpadatedAt,
    this.jobPreference,
  });

  factory UserJobPrefModel.fromJson(Map<String, dynamic> json) {
    return UserJobPrefModel(
      id: json['id'],
      vFirebaseId:json['vFirebaseId'],
      iRole: json['iRole'],
      vFirstName: json['vFirstName'],
      vLastName: json['vLastName'],
      vMobile: json['vMobile'],
      vEmail: json['vEmail'],
      tProfileUrl: json['tProfileUrl'],
      tProfileBannerUrl:json['tProfileBannerUrl'],
      tResumeUrl: json['tResumeUrl'],
      vCity: json['vCity'],
      tBio: json['tBio'],
      vCurrentCompany: json['vCurrentCompany'],
      vDesignation: json['vDesignation'],
      vJobLocation: json['vJobLocation'],
      vDuration: json['vDuration'],
      vPreferCity: json['vPreferCity'],
      vPreferJobTitle : json['vPreferJobTitle'],
      vQualification: json['vQualification'],
      vWorkingMode: json['vWorkingMode'],
      tTagLine: json['tTagLine'],
      googleid: json['googleid'],
      fbid: json['fbid'],
      isBlock: json['isBlock'],
      isLogin: json['isLogin'],
      tCreatedAt: json['tCreatedAt'],
      tUpadatedAt: json['tUpadatedAt'],
      jobPreference: json['jobPreference'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['vFirebaseId']=vFirebaseId;
    data['iRole'] = iRole;
    data['vFirstName'] = vFirstName;
    data['vLastName'] = vLastName;
    data['vMobile'] = vMobile;
    data['vEmail'] = vEmail;
    data['tProfileUrl'] = tProfileUrl;
    data['tProfileBannerUrl']=tProfileBannerUrl;
    data['tResumeUrl'] = tResumeUrl;
    data['vCity'] = vCity;
    data['tBio'] = tBio;
    data['vCurrentCompany'] = vCurrentCompany;
    data['vDesignation'] = vDesignation;
    data['vJobLocation'] = vJobLocation;
    data['vDuration'] = vDuration;
    data['vPreferCity'] = vPreferCity;
    data['vPreferJobTitle']=vPreferJobTitle;
    data['vQualification'] = vQualification;
    data['vWorkingMode'] = vWorkingMode;
    data['tTagLine'] = tTagLine;
    data['googleid'] = googleid;
    data['fbid'] = fbid;
    data['isBlock'] = isBlock;
    data['isLogin'] = isLogin;
    data['tCreatedAt'] = tCreatedAt;
    data['tUpadatedAt'] = tUpadatedAt;
    data['jobPreference'] = jobPreference;
    return data;
  }
}
