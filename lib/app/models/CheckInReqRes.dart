class CheckInReqRes {
  bool? isNewAttendee;
  String? fname;
  String? lname;
  String? orgId;
  String? email;
  String? badgeId;
  String? pin;
  bool? checkOut;
  String? eventName;
  bool? canCheckOut;

  CheckInReqRes();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['isNewAttendee'] = isNewAttendee;
    map['fname'] = fname;
    map['lname'] = lname;
    map['email'] = email;
    map['orgId'] = orgId;
    map['badgeId'] = badgeId;
    map['pin'] = pin;
    map['checkOut'] = checkOut;
    return map;
  }

  CheckInReqRes.fromJson(Map<String, dynamic> map) {
    canCheckOut = map['canCheckOut'];
    checkOut = map['checkOut'];
    eventName = map['eventName'];
  }
}
