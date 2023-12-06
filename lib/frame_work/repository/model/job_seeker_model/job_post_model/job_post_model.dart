// To parse this JSON data, do
//
//     final jobPost = jobPostFromJson(jsonString);

import 'dart:convert';

JobPostModel jobPostFromJson(String str) => JobPostModel.fromJson(json.decode(str));

String jobPostToJson(JobPostModel data) => json.encode(data.toJson());

class JobPostModel {
  final int? id;
  final int? iHrUserId;
  final String? vJobTitle;
  final String? vCompanyName;
  final String? tDes;
  final String? tCompanyLogoUrl;
  final String? vJobRoleResponsbility;
  final String? vJobLevel;
  final String? vExperience;
  final int? iStatus;
  final int? iIsApplied;
  final int? iIsSaved;
  final String? tTechnicalSkill;
  final String? tSoftSkill;
  final String? vEducation;
  final String? vAddress;
  final String? vSalaryPackage;
  final String? vWrokingMode;
  final int? iNumberOfVacancy;
  final int? iNumberOfApplied;
  final String? tCreatedAt;
  final String? tUpadatedAt;
  final User? user;

  JobPostModel({
    this.id,
    this.iHrUserId,
    this.vJobTitle,
    this.vCompanyName,
    this.tDes,
    this.tCompanyLogoUrl,
    this.vJobRoleResponsbility,
    this.vJobLevel,
    this.vExperience,
    this.iStatus,
    this.iIsApplied,
    this.iIsSaved,
    this.tTechnicalSkill,
    this.tSoftSkill,
    this.vEducation,
    this.vAddress,
    this.vSalaryPackage,
    this.vWrokingMode,
    this.iNumberOfVacancy,
    this.iNumberOfApplied,
    this.tCreatedAt,
    this.tUpadatedAt,
    this.user,
  });

  factory JobPostModel.fromJson(Map<String, dynamic> json) => JobPostModel(
    id: json["id"],
    iHrUserId: json["iHrUserId"],
    vJobTitle: json["vJobTitle"],
    vCompanyName: json["vCompanyName"],
    tDes: json["tDes"],
    tCompanyLogoUrl: json["tCompanyLogoUrl"],
    vJobRoleResponsbility: json["vJobRoleResponsbility"],
    vJobLevel: json["vJobLevel"],
    vExperience: json["vExperience"],
    iStatus: json["iStatus"],
    iIsApplied: json["iIsApplied"],
    iIsSaved: json["iIsSaved"],
    tTechnicalSkill: json["tTechnicalSkill"],
    tSoftSkill: json["tSoftSkill"],
    vEducation: json["vEducation"],
    vAddress: json["vAddress"],
    vSalaryPackage: json["vSalaryPackage"],
    vWrokingMode: json["vWrokingMode"],
    iNumberOfVacancy: json["iNumberOfVacancy"],
    iNumberOfApplied: json["iNumberOfApplied"],
    tCreatedAt: json["tCreatedAt"],
    tUpadatedAt: json["tUpadatedAt"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "iHrUserId": iHrUserId,
    "vJobTitle": vJobTitle,
    "vCompanyName": vCompanyName,
    "tDes": tDes,
    "tCompanyLogoUrl": tCompanyLogoUrl,
    "vJobRoleResponsbility": vJobRoleResponsbility,
    "vJobLevel": vJobLevel,
    "vExperience": vExperience,
    "iStatus": iStatus,
    "iIsApplied": iIsApplied,
    "iIsSaved": iIsSaved,
    "tTechnicalSkill": tTechnicalSkill,
    "tSoftSkill": tSoftSkill,
    "vEducation": vEducation,
    "vAddress": vAddress,
    "vSalaryPackage": vSalaryPackage,
    "vWrokingMode": vWrokingMode,
    "iNumberOfVacancy": iNumberOfVacancy,
    "iNumberOfApplied": iNumberOfApplied,
    "tCreatedAt": tCreatedAt,
    "tUpadatedAt": tUpadatedAt,
    "user": user?.toJson(),
  };
}

class User {
  final int? id;
  final String? vFirebaseId;
  final int? iRole;
  final String? vFirstName;
  final String? vLastName;
  final String? vMobile;
  final String? vEmail;
  final String? tProfileUrl;
  final dynamic tProfileBannerUrl;
  final dynamic tResumeUrl;
  final String? vCity;
  final String? tBio;
  final String? vCurrentCompany;
  final String? vDesignation;
  final String? vJobLocation;
  final dynamic vDuration;
  final dynamic vPreferCity;
  final dynamic vPreferJobTitle;
  final String? vQualification;
  final dynamic vWorkingMode;
  final String? tTagLine;
  final dynamic googleid;
  final dynamic fbid;
  final int? isBlock;
  final int? isLogin;
  final String? tCreatedAt;
  final String? tUpadatedAt;

  User({
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    vFirebaseId: json["vFirebaseId"],
    iRole: json["iRole"],
    vFirstName: json["vFirstName"],
    vLastName: json["vLastName"],
    vMobile: json["vMobile"],
    vEmail: json["vEmail"],
    tProfileUrl: json["tProfileUrl"],
    tProfileBannerUrl: json["tProfileBannerUrl"],
    tResumeUrl: json["tResumeUrl"],
    vCity: json["vCity"],
    tBio: json["tBio"],
    vCurrentCompany: json["vCurrentCompany"],
    vDesignation: json["vDesignation"],
    vJobLocation: json["vJobLocation"],
    vDuration: json["vDuration"],
    vPreferCity: json["vPreferCity"],
    vPreferJobTitle: json["vPreferJobTitle"],
    vQualification: json["vQualification"],
    vWorkingMode: json["vWorkingMode"],
    tTagLine: json["tTagLine"],
    googleid: json["googleid"],
    fbid: json["fbid"],
    isBlock: json["isBlock"],
    isLogin: json["isLogin"],
    tCreatedAt: json["tCreatedAt"],
    tUpadatedAt: json["tUpadatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vFirebaseId": vFirebaseId,
    "iRole": iRole,
    "vFirstName": vFirstName,
    "vLastName": vLastName,
    "vMobile": vMobile,
    "vEmail": vEmail,
    "tProfileUrl": tProfileUrl,
    "tProfileBannerUrl": tProfileBannerUrl,
    "tResumeUrl": tResumeUrl,
    "vCity": vCity,
    "tBio": tBio,
    "vCurrentCompany": vCurrentCompany,
    "vDesignation": vDesignation,
    "vJobLocation": vJobLocation,
    "vDuration": vDuration,
    "vPreferCity": vPreferCity,
    "vPreferJobTitle": vPreferJobTitle,
    "vQualification": vQualification,
    "vWorkingMode": vWorkingMode,
    "tTagLine": tTagLine,
    "googleid": googleid,
    "fbid": fbid,
    "isBlock": isBlock,
    "isLogin": isLogin,
    "tCreatedAt": tCreatedAt,
    "tUpadatedAt": tUpadatedAt,
  };
}
