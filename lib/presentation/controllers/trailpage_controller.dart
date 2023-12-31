// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pov/dto/trail_dto.dart';
import 'package:pov/repository/trail_repository.dart';

class TrailPageController {
  TrailRepository repository;

  TrailPageController({
    required this.repository,
  });

  Future<List<TrailDTO?>> listarTrilhas(int guia) async{
    try {
      return await repository.listarTrilhasPorGuia(guia);
    } catch (e) {
      rethrow;
    }
  }

}
