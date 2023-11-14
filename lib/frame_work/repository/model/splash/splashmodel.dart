class SplashModel {
  int? status;
  String? message;
  Data? data;

  SplashModel({this.status, this.message, this.data});

  SplashModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
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
  int? latestAppVersionCode;
  int? isForceUpdate;
  String? tMessage;
  int? isBlock;
  Nothing? nothing;

  Data(
      {this.latestAppVersionCode,
        this.isForceUpdate,
        this.tMessage,
        this.isBlock,
        this.nothing});

  Data.fromJson(Map<String, dynamic> json) {
    latestAppVersionCode = json['latestAppVersionCode'];
    isForceUpdate = json['isForceUpdate'];
    tMessage = json['tMessage'];
    isBlock = json['isBlock'];
    nothing =
    json['nothing'] != null ?  Nothing.fromJson(json['nothing']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latestAppVersionCode'] = latestAppVersionCode;
    data['isForceUpdate'] = isForceUpdate;
    data['tMessage'] = tMessage;
    data['isBlock'] = isBlock;
    if (nothing != null) {
      data['nothing'] = nothing!.toJson();
    }
    return data;
  }
}

class Nothing {
  String? vKey;
  String? vName;
  int? id;

  Nothing({this.vKey, this.vName, this.id});

  Nothing.fromJson(Map<String, dynamic> json) {
    vKey = json['vKey'];
    vName = json['vName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vKey'] = vKey;
    data['vName'] = vName;
    data['id'] = id;
    return data;
  }
}