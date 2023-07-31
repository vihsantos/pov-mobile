abstract class ApplicationError implements Exception {
  final String mensagem;
  final int? statusCode;

  ApplicationError({required this.mensagem, this.statusCode});
}
