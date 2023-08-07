import 'package:e_commerce/api/api_manager.dart';
import 'package:e_commerce/api/response/authentication_response/AuthenticationResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewModel extends Cubit<SignInViewState> {
  SignInViewModel() : super(InitialState());
  ApiManager apiManager = ApiManager();

  signIn(String userName, String password) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await apiManager.signIn(userName, password);
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

abstract class SignInViewState {}

class InitialState extends SignInViewState {}

class LoadingState extends SignInViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class SuccessState extends SignInViewState {
  AuthenticationResponse response;

  SuccessState(this.response);
}

class FailState extends SignInViewState {
  String? failMessage;

  FailState({this.failMessage});
}
