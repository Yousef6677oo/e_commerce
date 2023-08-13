import 'package:e_commerce/domain/model/VerifyResetCodeDto.dart';

class VerifyResetCodeResponse {
  VerifyResetCodeResponse({this.status, this.statusMsg, this.message});

  VerifyResetCodeResponse.fromJson(dynamic json) {
    status = json['status'];
    statusMsg = json['statusMsg'];
    message = json['message'];
  }

  String? status;
  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusMsg'] = statusMsg;
    map['message'] = message;
    return map;
  }

  bool isSuccess() {
    return status == 'Success';
  }

  VerifyResetCodeDto toVerifyResetCodeDto() {
    return VerifyResetCodeDto(
        status: status, statusMsg: statusMsg, message: message);
  }
}
