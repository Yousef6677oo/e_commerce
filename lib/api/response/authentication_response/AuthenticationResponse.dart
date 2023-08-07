import '../../common/Errors.dart';
import '../../common/User.dart';

class AuthenticationResponse {
  AuthenticationResponse(
      {this.message, this.user, this.token, this.statusMsg, this.errors});

  AuthenticationResponse.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    errors = json['errors'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? statusMsg;
  List<Error>? errors;
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusMsg'] = statusMsg;
    map['errors'] = errors;
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

  String getErrorMessages() {
    String errorMessage = '';
    errors?.forEach((error) {
      errorMessage += error.msg ?? '';
    });
    if (errorMessage == '' || errorMessage.isEmpty) {
      return message.toString();
    }
    return errorMessage;
  }
}
