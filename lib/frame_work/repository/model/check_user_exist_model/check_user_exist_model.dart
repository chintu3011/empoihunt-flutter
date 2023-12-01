class CheckUserExistModel {
  int? status;
  String? message;
  Data? data;

  CheckUserExistModel({this.status, this.message, this.data});

  CheckUserExistModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? iUserId;

  Data({this.iUserId});

  Data.fromJson(Map<String, dynamic> json) {
    iUserId = json['iUserId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iUserId'] = iUserId;
    return data;
  }
}
