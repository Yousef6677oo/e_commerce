import '../model/AuthenticationResultDto.dart';
import '../model/ForgotPasswordDto.dart';
import '../model/ResetPasswordDto.dart';
import '../model/VerifyResetCodeDto.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationResultDto> signIn(String userName, String password);

  Future<AuthenticationResultDto> signUp(String fullName, String mobileNumber,
      String emailAddress, String password);

  Future<ForgotPasswordDto> forgotPassword(String email);

  Future<VerifyResetCodeDto> verifyResetCode(String resetCode);

  Future<ResetPasswordDto> resetPassword(String email, String newPassword);
}
