class GetAllEventsModel {
  bool? success;
  String? message;
  List<GetAllEventsDataModel>? data;
  int? code;

  GetAllEventsModel({this.success, this.message, this.data, this.code});

  GetAllEventsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllEventsDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllEventsDataModel.fromJson(v));
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

class GetAllEventsDataModel {
  int? eventId;
  String? eventName;
  String? startDate;
  String? description;
  String? endDate;
  String? venue;
  String? roomName;
  String? attendees;
  List<LstAttendees>? lstAttendees;

  GetAllEventsDataModel(
      {this.eventId,
      this.eventName,
      this.description,
      this.startDate,
      this.endDate,
      this.venue,
      this.roomName,
      this.attendees,
      this.lstAttendees});

  GetAllEventsDataModel.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    eventName = json['eventName'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    venue = json['venue'];
    roomName = json['roomName'];
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
    data['eventId'] = eventId;
    data['eventName'] = eventName;
    data['description'] = description;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['venue'] = venue;
    data['roomName'] = roomName;
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
