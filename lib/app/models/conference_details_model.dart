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
  int? eventCount;
  List<Events>? events;

  GetConferanceByIdDataModel(
      {this.id,
      this.name,
      this.venue,
      this.description,
      this.photo,
      this.startDate,
      this.endDate,
      this.eventCount,
      this.events});

  GetConferanceByIdDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    venue = json['venue'];
    description = json['description'] ?? "";
    photo = json['photo'] ?? "";
    startDate = json['startDate'];
    endDate = json['endDate'];
    eventCount = json['eventCount'];
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(Events.fromJson(v));
      });
    }
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
    data['eventCount'] = eventCount;
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  int? eventId;
  String? eventName;
  String? startDate;
  String? endDate;
  String? venue;
  int? attendeeCount;
  List<Attendees>? attendees;

  Events(
      {this.eventId,
      this.eventName,
      this.startDate,
      this.endDate,
      this.venue,
      this.attendeeCount,
      this.attendees});

  Events.fromJson(Map<String, dynamic> json) {
    eventId = json['eventId'];
    eventName = json['eventName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    venue = json['venue'];
    attendeeCount = json['attendeeCount'];
    if (json['attendees'] != null) {
      attendees = <Attendees>[];
      json['attendees'].forEach((v) {
        attendees!.add(Attendees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = eventId;
    data['eventName'] = eventName;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['venue'] = venue;
    data['attendeeCount'] = attendeeCount;
    if (attendees != null) {
      data['attendees'] = attendees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendees {
  int? attendeeId;
  String? attendeeName;
  String? attendeeEmail;
  String? attendeePhoto;

  Attendees(
      {this.attendeeId,
      this.attendeeName,
      this.attendeeEmail,
      this.attendeePhoto});

  Attendees.fromJson(Map<String, dynamic> json) {
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
