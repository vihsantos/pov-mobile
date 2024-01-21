import 'package:flutter/material.dart';

import '../../models/comment_model.dart';
import '../../repository/comment_repository.dart';
import '../../dto/comment_dto.dart';
import '../../services/error/applicationerror.dart';

class CommentPageController {
  final CommentRepository repository;

  CommentPageController({
    required this.repository,
  });

  CommentDTO comment = CommentDTO();

  set _error(ApplicationError? error) => solicitacaoErrorApi.value = error;
  ApplicationError? get error => solicitacaoErrorApi.value;
  final solicitacaoErrorApi = ValueNotifier<ApplicationError?>(null);

  Future criarNovoComentario() async {
    _error = null;
    try {
      await repository.criarComentario(comment);
    } on ApplicationError catch (e) {
      _error = e;
    }
  }

  Future<List<CommentModel>?> listarComentarios() async {
    _error = null;
    try {
      List<CommentModel>? comentarios;

      if (comment.post_id != null) {
        comentarios =
            await repository.listarComentariosPorPost(comment.post_id!);
      }

      if (comment.trail_id != null) {
        comentarios =
            await repository.listarComentariosPorPost(comment.post_id!);
      }

      return comentarios;
    } on ApplicationError catch (e) {
      _error = e;
    }
    return null;
  }
}
