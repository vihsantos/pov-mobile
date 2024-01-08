// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FollowDTO {
  int? seguidor;
  int? seguindo;
  
  FollowDTO({
    this.seguidor,
    this.seguindo,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'seguidor': seguidor,
      'seguindo': seguindo,
    };
  }

  factory FollowDTO.fromMap(Map<String, dynamic> map) {
    return FollowDTO(
      seguidor: map['seguidor'] != null ? map['seguidor'] as int : null,
      seguindo: map['seguindo'] != null ? map['seguindo'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FollowDTO.fromJson(String source) => FollowDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
