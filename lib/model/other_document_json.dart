class otherDocumentDataJson {
  Others? others;

  otherDocumentDataJson({this.others});

  otherDocumentDataJson.fromJson(Map<String, dynamic> json) {
    others = json['others'] != null ? Others.fromJson(json['others']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (others != null) {
      data['others'] = others!.toJson();
    }
    return data;
  }
}

class Others {
  String? bcd;
  String? cdfi;
  String? cdbi;

  Others({this.bcd, this.cdfi, this.cdbi});

  Others.fromJson(Map<String, dynamic> json) {
    bcd = json['bcd'];
    cdfi = json['cdfi'];
    cdbi = json['cdbi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bcd'] = bcd;
    data['cdfi'] = cdfi;
    data['cdbi'] = cdbi;
    return data;
  }
}
