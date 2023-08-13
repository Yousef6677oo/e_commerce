import 'package:e_commerce/domain/model/AuthenticationResultDto.dart';

import '../repository/authentication_repository.dart';

class SignInUseCase {
  AuthenticationRepository authenticationRepository;

  SignInUseCase(this.authenticationRepository);

  Future<AuthenticationResultDto> invoke(
      String userName, String password) async {
    return await authenticationRepository.signIn(userName, password);
  }
}
