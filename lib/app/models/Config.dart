class ConfigCode {
  String? baseUrl;
  String? certificate;
  String? pass;
  String? resUrl;
  String? username;
  String? code;

  ConfigCode();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['BaseUrl'] = baseUrl;
    map['Certificate'] = certificate;
    map['Password'] = pass;
    map['ResUrl'] = resUrl;
    map['Username'] = username;
    map['Code'] = code;
    return map;
  }

  ConfigCode.fromJson(Map<String, dynamic> map) {
    baseUrl = map['BaseUrl'];
    certificate = map['Certificate'];
    pass = map['Password'];
    resUrl = map['ResUrl'];
    username = map['Username'];
    code = map['Code'];
  }
}
