import 'package:e_commerce/domain/model/UserDto.dart';

class AuthenticationResultDto {
  AuthenticationResultDto({this.user, this.token});

  UserDto? user;
  String? token;
}
