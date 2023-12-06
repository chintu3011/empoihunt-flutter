import 'package:hive/hive.dart';

part 'user_detail_data_model.g.dart';

@HiveType(typeId: 2)
class UserDetailDataModel extends HiveObject {
  @HiveField(0)
  String tAuthToken;

  @HiveField(1)
  int iUserId;

  @HiveField(2)
  String tDeviceToken;

  @HiveField(3)
  UserModel user;

  UserDetailDataModel({
    required this.tAuthToken,
    required this.iUserId,
    required this.tDeviceToken,
    required this.user,
  });

  // Factory method to create a Data from JSON
  factory UserDetailDataModel.fromJson(Map<String, dynamic> json) {
    return UserDetailDataModel(
      tAuthToken: json['tAuthToken'],
      iUserId: json['iUserId'],
      tDeviceToken: json['tDeviceToken'],
      user: UserModel.fromJson(json['user']),
    );
  }

  // Method to convert Data to JSON
  Map<String, dynamic> toJson() {
    return {
      'tAuthToken': tAuthToken,
      'iUserId': iUserId,
      'tDeviceToken': tDeviceToken,
      'user': user.toJson(),
    };
  }
}

@HiveType(typeId: 3)
class UserModel extends HiveObject {
  @HiveField(0)
  String vFirstName;

  @HiveField(1)
  String? vJobLocation;

  @HiveField(2)
  String? tResumeUrl;

  @HiveField(3)
  String vLastName;

  @HiveField(4)
  String? vDuration;

  @HiveField(5)
  String? vWorkingMode;

  @HiveField(6)
  String vMobile;

  @HiveField(7)
  String? vPreferCity;

  @HiveField(8)
  String? tTagLine;

  @HiveField(9)
  String vEmail;

  @HiveField(10)
  String? vPreferJobTitle;

  @HiveField(11)
  int isBlock;

  @HiveField(12)
  int id;

  @HiveField(13)
  String vCity;

  @HiveField(14)
  String? vQualification;

  @HiveField(15)
  int isLogin;

  @HiveField(16)
  String vFirebaseId;

  @HiveField(17)
  String? tBio;

  @HiveField(18)
  String? tProfileUrl;

  @HiveField(19)
  String tCreatedAt;

  @HiveField(20)
  int iRole;

  @HiveField(21)
  String? vCurrentCompany;

  @HiveField(22)
  String? tProfileBannerUrl;

  @HiveField(23)
  String? tUpadatedAt;

  @HiveField(24)
  String? vDesignation;

  UserModel({
    required this.vFirstName,
     this.vJobLocation,
     this.tResumeUrl,
    required this.vLastName,
     this.vDuration,
     this.vWorkingMode,
    required this.vMobile,
     this.vPreferCity,
     this.tTagLine,
    required this.vEmail,
     this.vPreferJobTitle,
    required this.isBlock,
    required this.id,
    required this.vCity,
     this.vQualification,
    required this.isLogin,
    required this.vFirebaseId,
     this.tBio,
     this.tProfileUrl,
    required this.tCreatedAt,
    required this.iRole,
     this.vCurrentCompany,
     this.tProfileBannerUrl,
     this.tUpadatedAt,
     this.vDesignation,
  });

  // Factory method to create a User from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      vFirstName: json['vFirstName'],
      vJobLocation: json['vJobLocation'],
      tResumeUrl: json['tResumeUrl'],
      vLastName: json['vLastName'],
      vDuration: json['vDuration'],
      vWorkingMode: json['vWorkingMode'],
      vMobile: json['vMobile'],
      vPreferCity: json['vPreferCity'],
      tTagLine: json['tTagLine'],
      vEmail: json['vEmail'],
      vPreferJobTitle: json['vPreferJobTitle'],
      isBlock: json['isBlock'],
      id: json['id'],
      vCity: json['vCity'],
      vQualification: json['vQualification'],
      isLogin: json['isLogin'],
      vFirebaseId: json['vFirebaseId'],
      tBio: json['tBio'],
      tProfileUrl: json['tProfileUrl'],
      tCreatedAt: json['tCreatedAt'],
      iRole: json['iRole'],
      vCurrentCompany: json['vCurrentCompany'],
      tProfileBannerUrl: json['tProfileBannerUrl'],
      tUpadatedAt: json['tUpadatedAt'],
      vDesignation: json['vDesignation'],
    );
  }

  // Method to convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'vFirstName': vFirstName,
      'vJobLocation': vJobLocation,
      'tResumeUrl': tResumeUrl,
      'vLastName': vLastName,
      'vDuration': vDuration,
      'vWorkingMode': vWorkingMode,
      'vMobile': vMobile,
      'vPreferCity': vPreferCity,
      'tTagLine': tTagLine,
      'vEmail': vEmail,
      'vPreferJobTitle': vPreferJobTitle,
      'isBlock': isBlock,
      'id': id,
      'vCity': vCity,
      'vQualification': vQualification,
      'isLogin': isLogin,
      'vFirebaseId': vFirebaseId,
      'tBio': tBio,
      'tProfileUrl': tProfileUrl,
      'tCreatedAt': tCreatedAt,
      'iRole': iRole,
      'vCurrentCompany': vCurrentCompany,
      'tProfileBannerUrl': tProfileBannerUrl,
      'tUpadatedAt': tUpadatedAt,
      'vDesignation': vDesignation,
    };
  }
}
