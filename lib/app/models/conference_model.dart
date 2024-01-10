class GetAllConferenceModel {
  bool? success;
  String? message;
  List<GetAllConferenceData>? data;
  int? code;

  GetAllConferenceModel({this.success, this.message, this.data, this.code});

  GetAllConferenceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllConferenceData>[];
      json['data'].forEach((v) {
        data!.add(GetAllConferenceData.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v).toList();
    }
    data['code'] = code;
    return data;
  }
}

class GetAllConferenceData {
  int? totalCount;
  int? id;
  String? name;
  String? venue;
  String? description;
  String? photo;
  String? startDate;
  String? endDate;
  int? eventCount;

  GetAllConferenceData(
      {this.totalCount,
      this.id,
      this.name,
      this.venue,
      this.description,
      this.photo,
      this.startDate,
      this.endDate,
      this.eventCount});

  GetAllConferenceData.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    id = json['id'];
    name = json['name'];
    venue = json['venue'];
    description = json['description'];
    photo = json['photo'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    eventCount = json['eventCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    data['id'] = id;
    data['name'] = name;
    data['venue'] = venue;
    data['description'] = description;
    data['photo'] = photo;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['eventCount'] = eventCount;
    return data;
  }
}
