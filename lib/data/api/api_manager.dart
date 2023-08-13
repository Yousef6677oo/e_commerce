import 'dart:convert';

import 'package:e_commerce/data/api/request/authentication_request/SignInRequest.dart';
import 'package:e_commerce/data/api/request/authentication_request/SignUpRequest.dart';
import 'package:e_commerce/data/api/response/authentication_response/AuthenticationResponse.dart';
import 'package:e_commerce/data/api/response/authentication_response/ForgotPasswordResponse.dart';
import 'package:e_commerce/data/api/response/authentication_response/ResetPasswordResponse.dart';
import 'package:e_commerce/data/api/response/authentication_response/VerifyResetCodeResponse.dart';
import 'package:e_commerce/data/api/response/categories/GetAllCategoriesResponse.dart';
import 'package:e_commerce/data/api/response/sub_categories/GetAllSubCategoriesResponse.dart';
import 'package:e_commerce/domain/model/AuthenticationResultDto.dart';
import 'package:e_commerce/domain/model/ForgotPasswordDto.dart';
import 'package:e_commerce/domain/model/GetAllCategoriesDto.dart';
import 'package:e_commerce/domain/model/GetAllSubCategoriesDto.dart';
import 'package:e_commerce/domain/model/VerifyResetCodeDto.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import '../../domain/model/ResetPasswordDto.dart';
import 'interceptor/logging_interceptor.dart';

class ApiManager {
  String baseUrl = 'route-ecommerce.onrender.com';
  http.Client client =
      InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  Future<AuthenticationResultDto> signIn(
      String userName, String password) async {
    var uri = Uri.https(baseUrl, 'api/v1/auth/signin');
    var requestBody = SignInRequest(email: userName, password: password);
    var response = await client.post(uri, body: requestBody.toJson());
    var signInResponse =
        AuthenticationResponse.fromJson(jsonDecode(response.body));
    return signInResponse.toAuthResultDto();
  }

  Future<AuthenticationResultDto> signUp(String fullName, String mobileNumber,
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
    return signUpResponse.toAuthResultDto();
  }

  Future<ForgotPasswordDto> forgotPassword(String email) async {
    var uri = Uri.https(baseUrl, 'api/v1/auth/forgotPasswords');
    var response = await client.post(uri, body: {"email": email});
    var forgotPasswordResponse =
        ForgotPasswordResponse.fromJson(jsonDecode(response.body));
    return forgotPasswordResponse.toForgotResultDto();
  }

  Future<VerifyResetCodeDto> verifyResetCode(String resetCode) async {
    var uri = Uri.https(baseUrl, 'api/v1/auth/verifyResetCode');
    var response = await client.post(uri, body: {"resetCode": resetCode});
    var verifyResetCodeResponse =
        VerifyResetCodeResponse.fromJson(jsonDecode(response.body));
    return verifyResetCodeResponse.toVerifyResetCodeDto();
  }

  Future<ResetPasswordDto> resetPassword(
      String email, String newPassword) async {
    var uri = Uri.https(baseUrl, 'api/v1/auth/resetPassword');
    var response = await client
        .put(uri, body: {"email": email, "newPassword": newPassword});
    var resetPasswordResponse =
        ResetPasswordResponse.fromJson(jsonDecode(response.body));
    return resetPasswordResponse.toResetPasswordDto();
  }

  Future<GetAllCategoriesDto> getAllCategories() async {
    var uri = Uri.https(baseUrl, 'api/v1/categories');
    var response = await client.get(uri);
    var getAllCategoriesResponse =
        GetAllCategoriesResponse.fromJson(jsonDecode(response.body));
    return getAllCategoriesResponse.toGetAllCategoriesDto();
  }

  Future<GetAllSubCategoriesDto> getAllSubCategories([String? id]) async {
    late var uri;
    if (id != null) {
      uri = Uri.https(baseUrl, 'api/v1/subcategories/$id');
    } else {
      uri = Uri.https(baseUrl, 'api/v1/subcategories');
    }
    var response = await client.get(uri);
    var getAllSubCategoriesResponse =
        GetAllSubCategoriesResponse.fromJson(jsonDecode(response.body));
    return getAllSubCategoriesResponse.toGetAllSubCategoriesDto();
  }

  Future<GetAllSubCategoriesDto> getAllSubCategoriesOnCategory(String id) async {
    var uri = Uri.https(baseUrl, 'api/v1/categories/$id/subcategories');
    var response = await client.get(uri);
    var getAllSubCategoriesResponse = GetAllSubCategoriesResponse.fromJson(jsonDecode(response.body));
    return getAllSubCategoriesResponse.toGetAllSubCategoriesDto();
  }
}
