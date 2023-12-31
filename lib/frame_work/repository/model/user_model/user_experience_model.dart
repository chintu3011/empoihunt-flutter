import 'package:hive/hive.dart';

part 'user_experience_model.g.dart';

@HiveType(typeId: 4)
class UserExperienceModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  int? iUserId;

  @HiveField(2)
  String? vDesignation;

  @HiveField(3)
  String? vCompanyName;

  @HiveField(4)
  String? vDuration;

  @HiveField(5)
  String? vJobLocation;

  @HiveField(6)
  int? bIsCurrentCompany;

  @HiveField(7)
  String? tCreatedAt;

  @HiveField(8)
  String? tUpadatedAt;

  UserExperienceModel({
    this.id,
    this.iUserId,
    this.vDesignation,
    this.vCompanyName,
    this.vDuration,
    this.vJobLocation,
    this.bIsCurrentCompany,
    this.tCreatedAt,
    this.tUpadatedAt,
  });

  factory UserExperienceModel.fromJson(Map<String, dynamic> json) {
    return UserExperienceModel(
      id: json['id'],
      iUserId: json['iUserId'],
      vDesignation: json['vDesignation'],
      vCompanyName: json['vCompanyName'],
      vDuration: json['vDuration'],
      vJobLocation: json['vJobLocation'],
      bIsCurrentCompany: json['bIsCurrentCompany'],
      tCreatedAt: json['tCreatedAt'],
      tUpadatedAt: json['tUpadatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['iUserId'] = iUserId;
    data['vDesignation'] = vDesignation;
    data['vCompanyName'] = vCompanyName;
    data['vDuration'] = vDuration;
    data['vJobLocation'] = vJobLocation;
    data['bIsCurrentCompany'] = bIsCurrentCompany;
    data['tCreatedAt'] = tCreatedAt;
    data['tUpadatedAt'] = tUpadatedAt;
    return data;
  }
}