import 'package:e_commerce/domain/model/UserDto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends Cubit<CurrentUserState> {
  UserDto user;
  String token;
  bool isLogged;

  AuthenticationProvider({required this.isLogged, required this.user,required this.token})
      : super(LoggedOutState());

  bool isUserLoggedIn() {
    return state is LoggedInState;
  }

  Future<void> login(LoggedInState loggedInState) async {
    emit(loggedInState);
    user = loggedInState.user;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogged', true);
  }

  void logout(LoggedOutState loggedInState) {
    emit(loggedInState);
  }
}

abstract class CurrentUserState {}

class LoggedInState extends CurrentUserState {
  UserDto user;
  String token;

  LoggedInState({required this.user, required this.token});
}

class LoggedOutState extends CurrentUserState {}
