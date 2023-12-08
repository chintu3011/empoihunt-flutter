// To parse this JSON data, do
//
//     final campusPlacementModel = campusPlacementModelFromJson(jsonString);

import 'dart:convert';

CampusPlacementModel campusPlacementModelFromJson(String str) => CampusPlacementModel.fromJson(json.decode(str));

String campusPlacementModelToJson(CampusPlacementModel data) => json.encode(data.toJson());

class CampusPlacementModel {
  final int? id;
  final String? vCampusName;
  final String? tCampusAddress;
  final String? vQualification;
  final String? tVacancy;
  final int? iNumberOfApplied;
  final int? iStatus;
  final String? tDate;
  final int? iIsApplied;
  final String? tRegistrationEndDate;
  final String? tCreatedAt;
  final String? tUpdatedAt;

  CampusPlacementModel({
    this.id,
    this.vCampusName,
    this.tCampusAddress,
    this.vQualification,
    this.tVacancy,
    this.iNumberOfApplied,
    this.iStatus,
    this.tDate,
    this.iIsApplied,
    this.tRegistrationEndDate,
    this.tCreatedAt,
    this.tUpdatedAt,
  });

  factory CampusPlacementModel.fromJson(Map<String, dynamic> json) => CampusPlacementModel(
    id: json["id"],
    vCampusName: json["vCampusName"],
    tCampusAddress: json["tCampusAddress"],
    vQualification: json["vQulification"],
    tVacancy: json["tVacancy"],
    iNumberOfApplied: json["iNumberOfApplied"],
    iStatus: json["iStatus"],
    tDate: json["tDate"],
    iIsApplied: json["iIsApplied"],
    tRegistrationEndDate: json["tRegistrationEndDate"],
    tCreatedAt: json["tCreatedAt"],
    tUpdatedAt: json["tUpadatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vCampusName": vCampusName,
    "tCampusAddress": tCampusAddress,
    "vQulification": vQualification,
    "tVacancy": tVacancy,
    "iNumberOfApplied": iNumberOfApplied,
    "iStatus": iStatus,
    "tDate": tDate,
    "iIsApplied": iIsApplied,
    "tRegistrationEndDate": tRegistrationEndDate,
    "tCreatedAt": tCreatedAt,
    "tUpadatedAt": tUpdatedAt,
  };
}
