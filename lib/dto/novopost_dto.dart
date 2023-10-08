// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import '../models/localization_model.dart';

class NovoPostDTO {
  String? description;
  int? stars;
  LocalizationModel? localization;
  int? user_id;
  DateTime? data_criacao;

  NovoPostDTO({
    this.description,
    this.stars,
    this.localization,
    this.user_id,
    this.data_criacao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'stars': stars,
      'localization': localization?.toJson(),
      'user_id': user_id,
      'data_criacao': data_criacao?.millisecondsSinceEpoch,
    };
  }

  factory NovoPostDTO.fromMap(Map<String, dynamic> map) {
    return NovoPostDTO(
      description:
          map['description'] != null ? map['description'] as String : null,
      stars: map['stars'] != null ? map['stars'] as int : null,
      localization: map['localization'] != null
          ? LocalizationModel.fromJson(
              map['localization'] as Map<String, dynamic>)
          : null,
      user_id: map['user_id'] != null ? map['user_id'] as int : null,
      data_criacao: map['data_criacao'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['data_criacao'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NovoPostDTO.fromJson(String source) =>
      NovoPostDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
