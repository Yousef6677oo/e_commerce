import 'package:e_commerce/domain/dataSource/authentication_online_dataSource.dart';

import '../../domain/model/AuthenticationResultDto.dart';
import '../../domain/model/ForgotPasswordDto.dart';
import '../../domain/model/ResetPasswordDto.dart';
import '../../domain/model/VerifyResetCodeDto.dart';
import '../../domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImplementation
    implements AuthenticationRepository {
  AuthenticationOnlineDataSource onlineDataSource;

  AuthenticationRepositoryImplementation(this.onlineDataSource);

  @override
  Future<AuthenticationResultDto> signIn(String userName, String password) {
    return onlineDataSource.signIn(userName, password);
  }

  @override
  Future<AuthenticationResultDto> signUp(String fullName, String mobileNumber,
      String emailAddress, String password) {
    return onlineDataSource.signUp(
        fullName, mobileNumber, emailAddress, password);
  }

  @override
  Future<ForgotPasswordDto> forgotPassword(String email) {
    return onlineDataSource.forgotPassword(email);
  }

  @override
  Future<ResetPasswordDto> resetPassword(String email, String newPassword) {
    return onlineDataSource.resetPassword(email, newPassword);
  }

  @override
  Future<VerifyResetCodeDto> verifyResetCode(String resetCode) {
    return verifyResetCode(resetCode);
  }
}
