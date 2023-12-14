class uploadTempFileModel {
  int? code;
  String? message;
  Data? data;

  uploadTempFileModel({this.code, this.message, this.data});

  uploadTempFileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? url;
  String? mime;

  Data({this.name, this.url, this.mime});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    mime = json['mime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    data['mime'] = mime;
    return data;
  }
}
