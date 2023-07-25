import 'package:pov/dto/novousuario_dto.dart';

import '../../repository/user_repository.dart';

class RegisterPageController {
  NovoUsuarioDTO usuario = NovoUsuarioDTO();
  final UserRepository userRepository;

  RegisterPageController(this.userRepository);

  Future cadastrarUsuario() async {}
}
