import 'package:e_commerce/api/api_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/response/authentication_response/ForgotPasswordResponse.dart';
import '../../api/response/authentication_response/ResetPasswordResponse.dart';
import '../../api/response/authentication_response/VerifyResetCodeResponse.dart';

class ForgotPasswordViewModel extends Cubit<ForgotPasswordViewState> {
  ForgotPasswordViewModel() : super(InitialState());
  ApiManager apiManager = ApiManager();

  forgotPassword(String email) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await apiManager.forgotPassword(email);
      if (!response.isSuccess()) {
        emit(FailState(
            failMessage:
                "There is no user registered with this email address"));
        return;
      }
      emit(SuccessEmailState(response));
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }

  verifyResetCode(String resetCode) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await apiManager.verifyResetCode(resetCode);
      if (!response.isSuccess()) {
        emit(FailState(failMessage: "Reset code is invalid or has expired"));
        return;
      }
      emit(SuccessResetCodeState(response));
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }

  resetPassword(String email, String newPassword) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await apiManager.resetPassword(email, newPassword);
      if (!response.isSuccess()) {
        emit(FailState(failMessage: response.errorMessage()));
        return;
      }
      emit(SuccessResetPasswordState(response));
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }
}

abstract class ForgotPasswordViewState {}

class InitialState extends ForgotPasswordViewState {}

class LoadingState extends ForgotPasswordViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class SuccessEmailState extends ForgotPasswordViewState {
  ForgotPasswordResponse response;

  SuccessEmailState(this.response);
}

class SuccessResetCodeState extends ForgotPasswordViewState {
  VerifyResetCodeResponse response;

  SuccessResetCodeState(this.response);
}

class SuccessResetPasswordState extends ForgotPasswordViewState {
  ResetPasswordResponse response;

  SuccessResetPasswordState(this.response);
}

class FailState extends ForgotPasswordViewState {
  String? failMessage;

  FailState({this.failMessage});
}
