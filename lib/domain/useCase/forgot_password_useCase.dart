import 'package:e_commerce/domain/repository/authentication_repository.dart';

import '../model/ForgotPasswordDto.dart';

class ForgotPasswordUseCase {
  AuthenticationRepository authenticationRepository;

  ForgotPasswordUseCase(this.authenticationRepository);

  Future<ForgotPasswordDto> invoke(String email) async {
    return await authenticationRepository.forgotPassword(email);
  }
}
