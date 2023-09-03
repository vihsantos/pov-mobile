// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pov/models/guide/guide_model.dart';
import 'package:pov/models/user/userprofile_model.dart';

class GuideDTO {
  GuideModel? guide;
  UserProfileModel? user;
  GuideDTO({
    this.guide,
    this.user,
  });

  GuideDTO.fromJson(Map<String, dynamic> json) {
    guide = json['guide'] != null ? GuideModel.FromJson(json['guide']) : null;
    user = json['user'] != null ? UserProfileModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (guide != null) {
      data['guide'] = guide!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
