import 'package:json_annotation/json_annotation.dart';



class PrivacyTermsCondition {
  int? status;
  String? message;
  Data? data;

  PrivacyTermsCondition({this.status, this.message, this.data});

  PrivacyTermsCondition.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? content;
  int? id;
  String? title;

  Data({this.content, this.id, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    content = json['content'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}