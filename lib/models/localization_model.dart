// ignore_for_file: public_member_api_docs, sort_constructors_first
class LocalizationModel {
  double? lat;
  double? long;
  String? local;

  LocalizationModel({
    this.lat,
    this.long,
    this.local,
  });

  LocalizationModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    local = json['local'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['local'] = local;
    data['long'] = long;
    return data;
  }
}
