// To parse this JSON data, do
//
//     final saveJobModel = saveJobModelFromJson(jsonString);

import 'dart:convert';

import 'package:emploiflutter/frame_work/repository/model/job_seeker_model/job_post_model/job_post_model.dart';

SaveJobModel saveJobModelFromJson(String str) => SaveJobModel.fromJson(json.decode(str));

String saveJobModelToJson(SaveJobModel data) => json.encode(data.toJson());

class SaveJobModel {
  final int? id;
  final int? iUserId;
  final int? iJobId;
  final String? tCreatedAt;
  final String? tUpadatedAt;
  final JobPostModel? job;
  final User? user;

  SaveJobModel({
    this.id,
    this.iUserId,
    this.iJobId,
    this.tCreatedAt,
    this.tUpadatedAt,
    this.job,
    this.user,
  });

  factory SaveJobModel.fromJson(Map<String, dynamic> json) => SaveJobModel(
    id: json["id"],
    iUserId: json["iUserId"],
    iJobId: json["iJobId"],
    tCreatedAt: json["tCreatedAt"],
    tUpadatedAt: json["tUpadatedAt"],
    job: json["job"] == null ? null : JobPostModel.fromJson(json["job"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "iUserId": iUserId,
    "iJobId": iJobId,
    "tCreatedAt": tCreatedAt,
    "tUpadatedAt": tUpadatedAt,
    "job": job?.toJson(),
    "user": user?.toJson(),
  };
}