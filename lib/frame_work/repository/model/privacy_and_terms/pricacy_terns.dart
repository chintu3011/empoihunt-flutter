
class PrivacyTermsCondition {
  int? status;
  String? message;
  Data? data;

  PrivacyTermsCondition({this.status, this.message, this.data});

  PrivacyTermsCondition.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['content'] = content;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}