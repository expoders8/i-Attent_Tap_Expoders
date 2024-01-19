class GetConferanceByIdModel {
  bool? success;
  String? message;
  GetConferanceByIdDataModel? data;
  int? code;

  GetConferanceByIdModel({this.success, this.message, this.data, this.code});

  GetConferanceByIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? GetConferanceByIdDataModel.fromJson(json['data'])
        : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
    return data;
  }
}

class GetConferanceByIdDataModel {
  int? id;
  String? name;
  String? venue;
  String? description;
  String? photo;
  String? startDate;
  String? endDate;
  String? companyName;
  String? companyLogo;
  String? companyIntro;

  GetConferanceByIdDataModel(
      {this.id,
      this.name,
      this.venue,
      this.description,
      this.photo,
      this.startDate,
      this.endDate,
      this.companyName,
      this.companyLogo,
      this.companyIntro});

  GetConferanceByIdDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    venue = json['venue'];
    description = json['description'] ?? "";
    photo = json['photo'] ?? "";
    startDate = json['startDate'];
    endDate = json['endDate'];
    companyName = json['companyName'];
    companyLogo = json['companyLogo'];
    companyIntro = json['companyIntro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['venue'] = venue;
    data['description'] = description;
    data['photo'] = photo;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['companyName'] = companyName;
    data['companyLogo'] = companyLogo;
    data['companyIntro'] = companyIntro;

    return data;
  }
}
