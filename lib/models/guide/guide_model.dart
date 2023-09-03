// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs, sort_constructors_first
class GuideModel {
 String? areaatuacao;
  String? codCadastur;

  GuideModel({this.areaatuacao, this.codCadastur});

  GuideModel.FromJson(Map<String, dynamic> json) {
    areaatuacao = json['areaatuacao'];
    codCadastur = json['cod_cadastur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['areaatuacao'] = areaatuacao;
    data['cod_cadastur'] = codCadastur;
    return data;
  }
}
