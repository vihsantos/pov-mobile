// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names

class NovoUsuarioDTO {
  final String? nome;
  final String? email;
  final String? username;
  final String? password;
  final DateTime? data_nascimento;
  final bool? guide;
  final String? cadastur;
  final String? areatuacao;
  final DateTime? data_vencimento;

  NovoUsuarioDTO(
      {this.nome,
      this.email,
      this.username,
      this.password,
      this.data_nascimento,
      this.guide,
      this.cadastur,
      this.areatuacao,
      this.data_vencimento});
}
