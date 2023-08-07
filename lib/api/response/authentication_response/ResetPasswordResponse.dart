class ResetPasswordResponse {
  ResetPasswordResponse({this.token, this.statusMsg, this.message});

  ResetPasswordResponse.fromJson(dynamic json) {
    token = json['token'];
    statusMsg = json['statusMsg'];
    message = json['message'];
  }

  String? token;
  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    return map;
  }

  bool isSuccess() {
    return statusMsg != 'fail';
  }

  String errorMessage() {
    return message ?? '';
  }
}
