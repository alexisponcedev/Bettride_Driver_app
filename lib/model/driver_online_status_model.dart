class driverOnlineStatusModel {
  int? code;
  String? message;
  List<bool>? data;

  driverOnlineStatusModel({this.code, this.message, this.data});

  driverOnlineStatusModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'].cast<bool>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
