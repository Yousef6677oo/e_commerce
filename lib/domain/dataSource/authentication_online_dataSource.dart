import '../../api/response/authentication_response/AuthenticationResponse.dart';

abstract class AuthenticationOnlineDataSource{
  Future<AuthenticationResponse> signIn(String userName, String password);

  Future<AuthenticationResponse> signUp(String fullName, String mobileNumber,
      String emailAddress, String password);
}
