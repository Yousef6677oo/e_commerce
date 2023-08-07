import 'package:e_commerce/api/common/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationProvider extends Cubit<CurrentUserState> {
  late User user;

  AuthenticationProvider() : super(LoggedOutState()) {
    //todo: will read data from shared preferences
  }

  bool isUserLoggedIn() {
    return state is LoggedInState;
  }

  void login(LoggedInState loggedInState) {
    emit(loggedInState);
    user = loggedInState.user;
  }

  void logout(LoggedOutState loggedInState) {
    emit(loggedInState);
  }
}

abstract class CurrentUserState {}

class LoggedInState extends CurrentUserState {
  User user;
  String token;

  LoggedInState({required this.user, required this.token});
}

class LoggedOutState extends CurrentUserState {}
