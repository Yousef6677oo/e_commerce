import 'package:e_commerce/domain/model/AuthenticationResultDto.dart';
import 'package:e_commerce/domain/repository/authentication_repository.dart';

class SignUpUseCase {
  AuthenticationRepository authenticationRepository;

  SignUpUseCase(this.authenticationRepository);

  Future<AuthenticationResultDto> invoke(String fullName, String mobileNumber,
      String emailAddress, String password) async {
    return await authenticationRepository.signUp(
        fullName, mobileNumber, emailAddress, password);
  }
}
