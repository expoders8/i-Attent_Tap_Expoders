class GetAllAgendaModel {
  bool? success;
  String? message;
  List<GetAllAgendaDataModel>? data;
  int? code;

  GetAllAgendaModel({this.success, this.message, this.data, this.code});

  GetAllAgendaModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllAgendaDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllAgendaDataModel.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = code;
    return data;
  }
}

class GetAllAgendaDataModel {
  int? id;
  String? title;
  String? description;
  String? location;
  String? startDate;
  String? endDate;
  int? eventId;
  int? userId;
  int? totalCount;
  int? totalAttendeeCount;

  GetAllAgendaDataModel(
      {this.id,
      this.title,
      this.description,
      this.location,
      this.startDate,
      this.endDate,
      this.eventId,
      this.userId,
      this.totalCount,
      this.totalAttendeeCount});

  GetAllAgendaDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    location = json['location'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    eventId = json['eventId'];
    userId = json['userId'];
    totalCount = json['totalCount'];
    totalAttendeeCount = json['totalAttendeeCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['location'] = location;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['eventId'] = eventId;
    data['userId'] = userId;
    data['totalCount'] = totalCount;
    data['totalAttendeeCount'] = totalAttendeeCount;
    return data;
  }
}
