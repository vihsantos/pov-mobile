class RankingByLocalModel {
  int? quantidade;
  int? stars;
  String? local;
  double? lat;
  double? long;

  RankingByLocalModel({
    this.quantidade,
    this.stars,
    this.local,
    this.lat,
    this.long,
  });

  RankingByLocalModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    local = json['local'];
    long = json['long'];
    quantidade = json['quantidade'];
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['local'] = local;
    data['long'] = long;
    data['quantidade'] = quantidade;
    data['stars'] = stars;
    return data;
  }
}
