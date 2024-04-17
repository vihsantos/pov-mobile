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

  String local = "";

  set _ranking(List<RankingByLocalModel?>? ranking) =>
      rankingApi.value = ranking;
  List<RankingByLocalModel?>? get ranking => rankingApi.value;
  final rankingApi = ValueNotifier<List<RankingByLocalModel?>?>(null);

  set _loading(bool? loading) => loadingApi.value = loading;
  bool? get loading => loadingApi.value;
  final loadingApi = ValueNotifier<bool?>(false);

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  Future getRankingByLocal() async {
    _error = null;
    _loading = true;
    try {
      List<RankingByLocalModel?> data =
          await rankingRepository.getRankingByLocal();
      _ranking = data;
    } on ApplicationError catch (e) {
      _error = e;
    }
    _loading = false;
  }

  Future searchGetRankingByLocal() async {
    _error = null;
    _loading = true;
    try {
      if (local != "") {
        List<RankingByLocalModel?> data = await rankingRepository
            .searchGetRankingByLocal(local.toUpperCase());
        _ranking = data;
      }
    } on ApplicationError catch (e) {
      _error = e;
    }
    _loading = false;
  }
}
