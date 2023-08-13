import 'package:e_commerce/domain/repository/authentication_repository.dart';

import '../model/VerifyResetCodeDto.dart';

class VerifyResetCodeUseCase {
  AuthenticationRepository authenticationRepository;

  VerifyResetCodeUseCase(this.authenticationRepository);

  Future<VerifyResetCodeDto> invoke(String resetCode) async {
    return await authenticationRepository.verifyResetCode(resetCode);
  }
}
