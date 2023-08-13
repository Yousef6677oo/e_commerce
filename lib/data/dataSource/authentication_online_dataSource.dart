import 'package:e_commerce/data/api/api_manager.dart';

import '../../domain/dataSource/authentication_online_dataSource.dart';
import '../../domain/model/AuthenticationResultDto.dart';
import '../../domain/model/ForgotPasswordDto.dart';
import '../../domain/model/ResetPasswordDto.dart';
import '../../domain/model/VerifyResetCodeDto.dart';

class AuthenticationOnlineDataSourceImplementation
    implements AuthenticationOnlineDataSource {
  ApiManager apiManager;

  AuthenticationOnlineDataSourceImplementation(this.apiManager);

  @override
  Future<AuthenticationResultDto> signIn(String userName, String password) {
    return apiManager.signIn(userName, password);
  }

  @override
  Future<AuthenticationResultDto> signUp(String fullName, String mobileNumber,
      String emailAddress, String password) {
    return apiManager.signUp(fullName, mobileNumber, emailAddress, password);
  }

  @override
  Future<ForgotPasswordDto> forgotPassword(String email) {
    return apiManager.forgotPassword(email);
  }

  @override
  Future<ResetPasswordDto> resetPassword(String email, String newPassword) {
    return apiManager.resetPassword(email, newPassword);
  }

  @override
  Future<VerifyResetCodeDto> verifyResetCode(String resetCode) {
    return apiManager.verifyResetCode(resetCode);
  }
}
