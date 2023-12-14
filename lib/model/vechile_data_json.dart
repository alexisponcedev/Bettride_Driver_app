class vehicleDataJson {
  Vehicle? vehicle;

  vehicleDataJson({this.vehicle});

  vehicleDataJson.fromJson(Map<String, dynamic> json) {
    vehicle =
        json['vehicle'] != null ? Vehicle.fromJson(json['vehicle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vehicle != null) {
      data['vehicle'] = vehicle!.toJson();
    }
    return data;
  }
}

class Vehicle {
  String? vfi;
  String? vbi;
  String? vehicleColor;
  String? vehicleNumber;
  String? purchaseYear;

  Vehicle(
      {this.vfi,
      this.vbi,
      this.vehicleColor,
      this.vehicleNumber,
      this.purchaseYear});

  Vehicle.fromJson(Map<String, dynamic> json) {
    vfi = json['vfi'];
    vbi = json['vbi'];
    vehicleColor = json['vehicle_color'];
    vehicleNumber = json['vehicle_number'];
    purchaseYear = json['purchase_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vfi'] = vfi;
    data['vbi'] = vbi;
    data['vehicle_color'] = vehicleColor;
    data['vehicle_number'] = vehicleNumber;
    data['purchase_year'] = purchaseYear;
    return data;
  }
}
