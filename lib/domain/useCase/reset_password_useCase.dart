import 'package:e_commerce/domain/repository/authentication_repository.dart';

import '../model/ResetPasswordDto.dart';

class ResetPasswordUseCase {
  AuthenticationRepository authenticationRepository;

  ResetPasswordUseCase(this.authenticationRepository);

  Future<ResetPasswordDto> invoke(String email, String newPassword) async {
    return await authenticationRepository.resetPassword(email, newPassword);
  }
}
