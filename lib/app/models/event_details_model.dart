class GetEventByIdModel {
  bool? success;
  String? message;
  GetEventByIdDataModel? data;
  int? code;

  GetEventByIdModel({this.success, this.message, this.data, this.code});

  GetEventByIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? GetEventByIdDataModel.fromJson(json['data'])
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

class GetEventByIdDataModel {
  int? id;
  String? eventName;
  String? description;
  String? startDate;
  String? endDate;
  String? roomName;
  String? venue;
  String? attendees;
  List<LstAttendees>? lstAttendees;

  GetEventByIdDataModel(
      {this.id,
      this.eventName,
      this.description,
      this.startDate,
      this.endDate,
      this.roomName,
      this.venue,
      this.attendees,
      this.lstAttendees});

  GetEventByIdDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['eventName'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    roomName = json['roomName'];
    venue = json['venue'];
    attendees = json['attendees'];
    if (json['lstAttendees'] != null) {
      lstAttendees = <LstAttendees>[];
      json['lstAttendees'].forEach((v) {
        lstAttendees!.add(LstAttendees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['eventName'] = eventName;
    data['description'] = description;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['roomName'] = roomName;
    data['venue'] = venue;
    data['attendees'] = attendees;
    if (lstAttendees != null) {
      data['lstAttendees'] = lstAttendees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LstAttendees {
  int? attendeeId;
  String? attendeeName;
  String? attendeeEmail;
  String? attendeePhoto;

  LstAttendees(
      {this.attendeeId,
      this.attendeeName,
      this.attendeeEmail,
      this.attendeePhoto});

  LstAttendees.fromJson(Map<String, dynamic> json) {
    attendeeId = json['attendeeId'];
    attendeeName = json['attendeeName'];
    attendeeEmail = json['attendeeEmail'];
    attendeePhoto = json['attendeePhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attendeeId'] = attendeeId;
    data['attendeeName'] = attendeeName;
    data['attendeeEmail'] = attendeeEmail;
    data['attendeePhoto'] = attendeePhoto;
    return data;
  }
}
