// To parse this JSON data, do
//
//     final jobPreferenceModel = jobPreferenceModelFromJson(jsonString);

import 'dart:convert';

import '../job_seeker_model/job_post_model/job_post_model.dart';

JobPreferenceModel jobPreferenceModelFromJson(String str) => JobPreferenceModel.fromJson(json.decode(str));

String jobPreferenceModelToJson(JobPreferenceModel data) => json.encode(data.toJson());

class JobPreferenceModel {
  final int? id;
  final int? iUserId;
  final String? vJobTitle;
  final String? vExpectedSalary;
  final String? vWorkingMode;
  final String? vJobLocation;
  final String? tCreatedAt;
  final String? tUpadatedAt;
  final User? user;

  JobPreferenceModel({
    this.id,
    this.iUserId,
    this.vJobTitle,
    this.vExpectedSalary,
    this.vWorkingMode,
    this.vJobLocation,
    this.tCreatedAt,
    this.tUpadatedAt,
    this.user,
  });

  factory JobPreferenceModel.fromJson(Map<String, dynamic> json) => JobPreferenceModel(
    id: json["id"],
    iUserId: json["iUserId"],
    vJobTitle: json["vJobTitle"],
    vExpectedSalary: json["vExpectedSalary"],
    vWorkingMode: json["vWorkingMode"],
    vJobLocation: json["vJobLocation"],
    tCreatedAt: json["tCreatedAt"],
    tUpadatedAt: json["tUpadatedAt"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "iUserId": iUserId,
    "vJobTitle": vJobTitle,
    "vExpectedSalary": vExpectedSalary,
    "vWorkingMode": vWorkingMode,
    "vJobLocation": vJobLocation,
    "tCreatedAt": tCreatedAt,
    "tUpadatedAt": tUpadatedAt,
    "user": user?.toJson(),
  };
}
