// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pov/dto/trail_dto.dart';
import '../../repository/trail_repository.dart';
import '../../services/error/applicationerror.dart';

class NewTrailPageController {
  final TrailRepository repository;
  NewTrailPageController({
    required this.repository,
  });

  final ValueNotifier<List<File>> filesNotifier = ValueNotifier<List<File>>([]);

  set files(List<File> files) => filesNotifier.value = files;

  List<File> get files => filesNotifier.value;
  int get filesCount => files.length;
  bool get hasFiles => filesCount != 0;

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  TrailDTO trailDTO = TrailDTO();

  Future selecionarArquivos() async {
    final filePickerResult = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: [
          'png',
          'jpg',
          'pdf',
          'zip',
          'docx',
          'jpeg',
        ]);

    if (filePickerResult == null) return;

    files = filePickerResult.paths.map((path) => File(path!)).toList();

    if (files.length > 2) files = [];
  }

  Future enviarImagem() async {
    _error = null;
    try {
      List<MultipartFile> arquivos = List.empty(growable: true);

      for(int x =0; x< files.length; x++){
        String filename = files[x].path.split("/").last;
        var pic = await MultipartFile.fromPath(filename, files[x].path);
        arquivos.add(pic);
      }
      return await repository.criarNovaTrilha(arquivos, trailDTO);
    } on ApplicationError catch (e) {
      _error = e;
    }
  }
}
