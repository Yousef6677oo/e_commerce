import 'dart:convert';

import 'package:e_commerce/api/request/authentication_request/SignInRequest.dart';
import 'package:e_commerce/api/request/authentication_request/SignUpRequest.dart';
import 'package:e_commerce/api/response/authentication_response/AuthenticationResponse.dart';
import 'package:e_commerce/api/response/authentication_response/ForgotPasswordResponse.dart';
import 'package:e_commerce/api/response/authentication_response/ResetPasswordResponse.dart';
import 'package:e_commerce/api/response/authentication_response/VerifyResetCodeResponse.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptor/logging_interceptor.dart';

class ApiManager {
  String baseUrl = 'route-ecommerce.onrender.com';
  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<AuthenticationResponse> signIn(
      String userName, String password) async {
    var uri = Uri.https(baseUrl, 'api/v1/auth/signin');
    var requestBody = SignInRequest(email: userName, password: password);
    var response = await client.post(uri, body: requestBody.toJson());
    var signInResponse =
        AuthenticationResponse.fromJson(jsonDecode(response.body));
    return signInResponse;
  }

  Future<AuthenticationResponse> signUp(String fullName, String mobileNumber,
      String emailAddress, String password) async {
    var uri = Uri.https(baseUrl, 'api/v1/auth/signup');
    var requestBody = SignUpRequest(
        name: fullName,
        email: emailAddress,
        password: password,
        rePassword: password,
        phone: mobileNumber);
    var response = await client.post(uri, body: requestBody.toJson());
    var signUpResponse =
        AuthenticationResponse.fromJson(jsonDecode(response.body));
    return signUpResponse;
  }

  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    var uri = Uri.https(baseUrl, 'api/v1/auth/forgotPasswords');
    var response = await client.post(uri, body: {"email": email});
    var forgotPasswordResponse =
        ForgotPasswordResponse.fromJson(jsonDecode(response.body));
    return forgotPasswordResponse;
  }

  Future<VerifyResetCodeResponse> verifyResetCode(String resetCode) async {
    var uri = Uri.https(baseUrl, 'api/v1/auth/verifyResetCode');
    var response = await client.post(uri, body: {"resetCode": resetCode});
    var verifyResetCodeResponse =
        VerifyResetCodeResponse.fromJson(jsonDecode(response.body));
    return verifyResetCodeResponse;
  }

  Future<ResetPasswordResponse> resetPassword(
      String email, String newPassword) async {
    var uri = Uri.https(baseUrl, 'api/v1/auth/resetPassword');
    var response = await client
        .put(uri, body: {"email": email, "newPassword": newPassword});
    var resetPasswordResponse =
        ResetPasswordResponse.fromJson(jsonDecode(response.body));
    return resetPasswordResponse;
  }
}
