import 'package:e_commerce/data/dataSource/authentication_online_dataSource.dart';
import 'package:e_commerce/domain/dataSource/authentication_online_dataSource.dart';
import 'package:e_commerce/domain/model/ForgotPasswordDto.dart';
import 'package:e_commerce/domain/model/ResetPasswordDto.dart';
import 'package:e_commerce/domain/model/VerifyResetCodeDto.dart';
import 'package:e_commerce/domain/repository/authentication_repository.dart';
import 'package:e_commerce/domain/useCase/forgot_password_useCase.dart';
import 'package:e_commerce/domain/useCase/reset_password_useCase.dart';
import 'package:e_commerce/domain/useCase/verify_reset_code_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/api_manager.dart';
import '../../data/repository/authentication_repository.dart';

class ForgotPasswordViewModel extends Cubit<ForgotPasswordViewState> {
  late ApiManager apiManager;
  late AuthenticationOnlineDataSource onlineDataSource;
  late AuthenticationRepository authenticationRepository;
  late ForgotPasswordUseCase forgotPasswordUseCase;
  late VerifyResetCodeUseCase verifyResetCodeUseCase;
  late ResetPasswordUseCase resetPasswordUseCase;

  ForgotPasswordViewModel() : super(InitialState()) {
    apiManager = ApiManager();
    onlineDataSource = AuthenticationOnlineDataSourceImplementation(apiManager);
    authenticationRepository =
        AuthenticationRepositoryImplementation(onlineDataSource);
    forgotPasswordUseCase = ForgotPasswordUseCase(authenticationRepository);
    verifyResetCodeUseCase = VerifyResetCodeUseCase(authenticationRepository);
    resetPasswordUseCase = ResetPasswordUseCase(authenticationRepository);
  }

  forgotPassword(String email) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await forgotPasswordUseCase.invoke(email);
      // if (!response.isSuccess()) {
      //   emit(FailState(
      //       failMessage:
      //           "There is no user registered with this email address"));
      //   return;
      // }
      emit(SuccessEmailState(response));
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }

  verifyResetCode(String resetCode) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await verifyResetCodeUseCase.invoke(resetCode);
      // if (!response.isSuccess()) {
      //   emit(FailState(failMessage: "Reset code is invalid or has expired"));
      //   return;
      // }
      emit(SuccessResetCodeState(response));
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }

  resetPassword(String email, String newPassword) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await resetPasswordUseCase.invoke(email, newPassword);
      // if (!response.isSuccess()) {
      //   emit(FailState(failMessage: response.errorMessage()));
      //   return;
      // }
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
  ForgotPasswordDto response;

  SuccessEmailState(this.response);
}

class SuccessResetCodeState extends ForgotPasswordViewState {
  VerifyResetCodeDto response;

  SuccessResetCodeState(this.response);
}

class SuccessResetPasswordState extends ForgotPasswordViewState {
  ResetPasswordDto response;

  SuccessResetPasswordState(this.response);
}

class FailState extends ForgotPasswordViewState {
  String? failMessage;

  FailState({this.failMessage});
}
