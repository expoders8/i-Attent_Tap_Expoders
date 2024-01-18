class GetAllAttechmentModel {
  bool? success;
  String? message;
  List<GetAllAttechmentDataModel>? data;
  int? code;

  GetAllAttechmentModel({this.success, this.message, this.data, this.code});

  GetAllAttechmentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllAttechmentDataModel>[];
      json['data'].forEach((v) {
        data!.add(GetAllAttechmentDataModel.fromJson(v));
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

class GetAllAttechmentDataModel {
  int? id;
  int? eventId;
  String? description;
  String? attachment;
  String? createdOn;

  GetAllAttechmentDataModel(
      {this.id,
      this.eventId,
      this.description,
      this.attachment,
      this.createdOn});

  GetAllAttechmentDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['eventId'];
    description = json['description'];
    attachment = json['attachment'];
    createdOn = json['createdOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['eventId'] = eventId;
    data['description'] = description;
    data['attachment'] = attachment;
    data['createdOn'] = createdOn;
    return data;
  }
}
