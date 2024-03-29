class GetAgendaByIdModel {
  bool? success;
  String? message;
  GetAgendaByIdDataModel? data;
  int? code;

  GetAgendaByIdModel({this.success, this.message, this.data, this.code});

  GetAgendaByIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? GetAgendaByIdDataModel.fromJson(json['data'])
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

class GetAgendaByIdDataModel {
  int? id;
  String? title;
  String? description;
  String? venue;
  String? startDate;
  String? endDate;
  int? eventId;
  List<Attendees>? attendees;

  GetAgendaByIdDataModel(
      {this.id,
      this.title,
      this.description,
      this.venue,
      this.startDate,
      this.endDate,
      this.eventId,
      this.attendees});

  GetAgendaByIdDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    venue = json['venue'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    eventId = json['eventId'];
    if (json['attendees'] != null) {
      attendees = <Attendees>[];
      json['attendees'].forEach((v) {
        attendees!.add(Attendees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['venue'] = venue;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['eventId'] = eventId;
    if (attendees != null) {
      data['attendees'] = attendees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendees {
  int? id;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? photo;

  Attendees(
      {this.id, this.firstName, this.lastName, this.emailAddress, this.photo});

  Attendees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailAddress'] = emailAddress;
    data['photo'] = photo;
    return data;
  }
}
