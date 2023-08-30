import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:pov/repository/post_repository.dart';

import '../../dto/novopost_dto.dart';
import '../../services/error/applicationerror.dart';

class NewPostPageController {
  final PostRepository repository;
  NovoPostDTO novoPost = NovoPostDTO();

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  NewPostPageController({required this.repository});

  Future enviarImagem(File file) async {
    _error = null;
    try {
      var pic = await MultipartFile.fromPath("arquivo", file.path);
      return await repository.criarNovoPost(pic, novoPost);
    } on ApplicationError catch (e) {
      _error = e;
    }
  }

    Future<Position> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
