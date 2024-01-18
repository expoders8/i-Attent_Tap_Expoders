class GetAllNotificationModel {
  bool? success;
  String? message;
  List<GetAllNotificationDataModel>? data;
  int? code;

  GetAllNotificationModel({this.success, this.message, this.data, this.code});

  GetAllNotificationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllNotificationDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllNotificationDataModel.fromJson(v));
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

class GetAllNotificationDataModel {
  int? id;
  String? title;
  String? text;
  int? userId;
  String? firstName;
  String? lastName;
  String? emailAddress;
  String? profilePhoto;
  String? createdOn;

  GetAllNotificationDataModel(
      {this.id,
      this.title,
      this.text,
      this.userId,
      this.firstName,
      this.lastName,
      this.emailAddress,
      this.profilePhoto,
      this.createdOn});

  GetAllNotificationDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    emailAddress = json['emailAddress'];
    profilePhoto = json['profilePhoto'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['text'] = text;
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['emailAddress'] = emailAddress;
    data['profilePhoto'] = profilePhoto;
    data['createdOn'] = createdOn;
    return data;
  }
}
