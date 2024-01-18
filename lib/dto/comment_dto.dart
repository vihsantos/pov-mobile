import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
class CommentDTO {
  int? post_id;
  int? user_id;
  String? descricao;
  int? trail_id;

  CommentDTO({
    this.post_id,
    this.user_id,
    this.descricao,
    this.trail_id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'post_id': post_id,
      'user_id': user_id,
      'descricao': descricao,
      'trail_id': trail_id,
    };
  }

  factory CommentDTO.fromMap(Map<String, dynamic> map) {
    return CommentDTO(
      post_id: map['post_id'] != null ? map['post_id'] as int : null,
      user_id: map['user_id'] != null ? map['user_id'] as int : null,
      descricao: map['descricao'] != null ? map['descricao'] as String : null,
      trail_id: map['trail_id'] != null ? map['trail_id'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentDTO.fromJson(String source) =>
      CommentDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
