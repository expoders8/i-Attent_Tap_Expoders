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
  String? speakers;
  List<LstAttendees>? lstAttendees;
  List<LstSpeakers>? lstSpeakers;
  bool? isAgendaExist;

  GetEventByIdDataModel(
      {this.id,
      this.eventName,
      this.description,
      this.startDate,
      this.endDate,
      this.roomName,
      this.venue,
      this.attendees,
      this.speakers,
      this.lstAttendees,
      this.lstSpeakers,
      this.isAgendaExist});

  GetEventByIdDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['eventName'];
    description = json['description'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    roomName = json['roomName'];
    venue = json['venue'];
    attendees = json['attendees'];
    speakers = json['speakers'];
    if (json['lstAttendees'] != null) {
      lstAttendees = <LstAttendees>[];
      json['lstAttendees'].forEach((v) {
        lstAttendees!.add(LstAttendees.fromJson(v));
      });
    }
    if (json['lstSpeakers'] != null) {
      lstSpeakers = <LstSpeakers>[];
      json['lstSpeakers'].forEach((v) {
        lstSpeakers!.add(LstSpeakers.fromJson(v));
      });
    }
    isAgendaExist = json['isAgendaExist'];
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
    data['speakers'] = speakers;
    data['isAgendaExist'] = isAgendaExist;
    if (lstAttendees != null) {
      data['lstAttendees'] = lstAttendees!.map((v) => v.toJson()).toList();
    }
    if (lstSpeakers != null) {
      data['lstSpeakers'] = lstSpeakers!.map((v) => v.toJson()).toList();
    }
    data['isAgendaExist'] = isAgendaExist;
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

class LstSpeakers {
  int? speakerId;
  String? speakerName;
  String? speakerEmail;

  LstSpeakers({
    this.speakerId,
    this.speakerName,
    this.speakerEmail,
  });

  LstSpeakers.fromJson(Map<String, dynamic> json) {
    speakerId = json['speakerId'];
    speakerName = json['speakerName'];
    speakerEmail = json['speakerEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['speakerId'] = speakerId;
    data['speakerName'] = speakerName;
    data['speakerEmail'] = speakerEmail;
    return data;
  }
}
