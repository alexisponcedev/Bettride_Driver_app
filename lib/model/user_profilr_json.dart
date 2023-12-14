class userprofileJson {
  Driver? driver;

  userprofileJson({this.driver});

  userprofileJson.fromJson(Map<String, dynamic> json) {
    driver = json['driver'] != null ? Driver.fromJson(json['driver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (driver != null) {
      data['driver'] = driver!.toJson();
    }
    return data;
  }
}

class Driver {
  String? dpi;
  String? dlfi;
  String? dlpi;

  Driver({this.dpi, this.dlfi, this.dlpi});

  Driver.fromJson(Map<String, dynamic> json) {
    dpi = json['dpi'];
    dlfi = json['dlfi'];
    dlpi = json['dlpi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dpi'] = dpi;
    data['dlfi'] = dlfi;
    data['dlpi'] = dlpi;
    return data;
  }
}
