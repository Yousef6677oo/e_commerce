import '../../../../domain/model/AuthenticationResultDto.dart';
import 'Error.dart';
import 'User.dart';

class AuthenticationResponse {
  AuthenticationResponse(
      {this.message, this.user, this.token, this.statusMsg, this.error});

  AuthenticationResponse.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    error = json['errors'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? statusMsg;
  Error? error;
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['errors'] = error;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  bool isSuccess() {
    return message == 'success';
  }

  String getErrorMessage() {
    return message ?? error?.msg ?? '';
  }

  AuthenticationResultDto toAuthResultDto() {
    return AuthenticationResultDto(user: user?.toUserDto(), token: token);
  }
}
