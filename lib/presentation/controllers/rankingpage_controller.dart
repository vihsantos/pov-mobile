// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pov/models/ranking/rankingbylocal_model.dart';
import 'package:pov/repository/ranking_repository.dart';

import '../../services/error/applicationerror.dart';

class RankingPageController {
  RankingRepository rankingRepository;

  RankingPageController({
    required this.rankingRepository,
  });

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  Future<List<RankingByLocalModel?>?> getRankingByLocal() async {
    _error = null;
    try {
      List<RankingByLocalModel?> data =
          await rankingRepository.getRankingByLocal();
      return data;
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }
}
