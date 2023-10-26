import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class NewTrailPageController {
  final ValueNotifier<List<File>>filesNotifier = ValueNotifier<List<File>>([]);

  set files(List<File> files) => filesNotifier.value = files;

  List<File> get files => filesNotifier.value;
  int get filesCount => files.length;
  bool get hasFiles => filesCount != 0;

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

    int sizeInBytes = 0;

    for (int x = 0; x < files.length; x++) {
      sizeInBytes += files[x].lengthSync();
    }

    final sizeInMb = sizeInBytes / (1024 * 1024);

    if (sizeInMb > 5) files = [];
  }
}
