class AppliedCandidateExperienceModel {
  int? id;
  int? iUserId;
  String? vDesignation;
  String? vCompanyName;
  String? vDuration;
  String? vJobLocation;
  int? bIsCurrentCompany;
  String? tCreatedAt;
  String? tUpadatedAt;

  AppliedCandidateExperienceModel(
      {this.id,
        this.iUserId,
        this.vDesignation,
        this.vCompanyName,
        this.vDuration,
        this.vJobLocation,
        this.bIsCurrentCompany,
        this.tCreatedAt,
        this.tUpadatedAt});

  AppliedCandidateExperienceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iUserId = json['iUserId'];
    vDesignation = json['vDesignation'];
    vCompanyName = json['vCompanyName'];
    vDuration = json['vDuration'];
    vJobLocation = json['vJobLocation'];
    bIsCurrentCompany = json['bIsCurrentCompany'];
    tCreatedAt = json['tCreatedAt'];
    tUpadatedAt = json['tUpadatedAt'];
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
