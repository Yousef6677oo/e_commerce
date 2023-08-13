import 'package:e_commerce/domain/model/UserDto.dart';

class User {
  User({
    this.name,
    this.email,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }

  String? name;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    return map;
  }

  UserDto toUserDto() {
    return UserDto(name: name, email: email);
  }
}
