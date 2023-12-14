class verfiy_otp_model {
  int? code;
  String? message;
  Data? data;

  verfiy_otp_model({this.code, this.message, this.data});

  verfiy_otp_model.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? accessToken;
  String? name;
  String? email;
  String? phoneNumber;
  String? status;
  String? gender;
  String? dob;

  Data(
      {this.id,
      this.accessToken,
      this.name,
      this.email,
      this.phoneNumber,
      this.status,
      this.gender,
      this.dob});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accessToken = json['access_token'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    status = json['status'];
    gender = json['gender'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['access_token'] = accessToken;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['status'] = status;
    data['gender'] = gender;
    data['dob'] = dob;
    return data;
  }
}
