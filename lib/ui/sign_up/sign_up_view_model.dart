import 'package:e_commerce/api/api_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/response/authentication_response/AuthenticationResponse.dart';

class SignUpViewModel extends Cubit<SignUpViewState> {
  SignUpViewModel() : super(InitialState());
  ApiManager apiManager = ApiManager();

  signUp(String fullName, String mobileNumber, String emailAddress,
      String password) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await apiManager.signUp(
          fullName, mobileNumber, emailAddress, password);
      if (!response.isSuccess()) {
        emit(FailState(failMessage: response.getErrorMessages()));
        return;
      }
      emit(SuccessState(response));
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }
}

abstract class SignUpViewState {}

class InitialState extends SignUpViewState {}

class LoadingState extends SignUpViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class SuccessState extends SignUpViewState {
  AuthenticationResponse response;

  SuccessState(this.response);
}

class FailState extends SignUpViewState {
  String? failMessage;

  FailState({this.failMessage});
}
