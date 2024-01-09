class SplashModel {
  int? status;
  String? message;
  Data? data;

  SplashModel({this.status, this.message, this.data});

  SplashModel.fromJson(Map<String, dynamic> json) {
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
  int? latestAppVersionCode;
  int? isForceUpdate;
  String? tMessage;
  int? isBlock;
  int? isDeleted;
  int? latestAppVersionCodeIOS;
  int? isForceUpdateIOS;
  String? tMessageIOS;
  Nothing? nothing;

  Data(
      {this.latestAppVersionCode,
        this.isForceUpdate,
        this.tMessage,
        this.isBlock,
        this.isDeleted,
        this.latestAppVersionCodeIOS,
        this.isForceUpdateIOS,
        this.tMessageIOS,
        this.nothing});

  Data.fromJson(Map<String, dynamic> json) {
    latestAppVersionCode = json['latestAppVersionCode'];
    isForceUpdate = json['isForceUpdate'];
    tMessage = json['tMessage'];
    isBlock = json['isBlock'];
    isDeleted = json['isDeleted'];
    latestAppVersionCodeIOS = json['latestAppVersionCodeIOS'];
    isForceUpdateIOS = json['isForceUpdateIOS'];
    tMessageIOS = json['tMessageIOS'];
    nothing =
    json['nothing'] != null ? new Nothing.fromJson(json['nothing']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latestAppVersionCode'] = this.latestAppVersionCode;
    data['isForceUpdate'] = this.isForceUpdate;
    data['tMessage'] = this.tMessage;
    data['isBlock'] = this.isBlock;
    data['isDeleted'] = this.isDeleted;
    data['latestAppVersionCodeIOS'] = this.latestAppVersionCodeIOS;
    data['isForceUpdateIOS'] = this.isForceUpdateIOS;
    data['tMessageIOS'] = this.tMessageIOS;
    if (this.nothing != null) {
      data['nothing'] = this.nothing!.toJson();
    }
    return data;
  }
}

class Nothing {
  String? vName;
  String? vKey;
  int? id;

  Nothing({this.vName, this.vKey, this.id});

  Nothing.fromJson(Map<String, dynamic> json) {
    vName = json['vName'];
    vKey = json['vKey'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vName'] = this.vName;
    data['vKey'] = this.vKey;
    data['id'] = this.id;
    return data;
  }
}
