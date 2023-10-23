// ignore_for_file: file_names

enum AreaAtuacao {
  ecoturismo(1, "Ecoturismo"),
  aventura(2, "Turismo de Aventura"),
  esporte(3, "Turismo de Esporte"),
  cultural(4, "Turismo Cultural"),
  solepraia(5, "Turismo de Sol e Praia"),
  rural(6, "Turismo Rural"),
  negocios(7, "Turismo de Negócios e Eventos"),
  pesca(8, "Turismo de Pesca"),
  nautico(9, "Turismo Náutico "),
  nenhum(10,
      "O(A) Guia de Turismo não é especialista em nenhum dos segmentos turísticos antes citados");

  const AreaAtuacao(
    this.id,
    this.descricao,
  );

  final int id;
  final String descricao;
}
