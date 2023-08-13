import 'package:e_commerce/data/dataSource/authentication_online_dataSource.dart';
import 'package:e_commerce/data/repository/authentication_repository.dart';
import 'package:e_commerce/domain/dataSource/authentication_online_dataSource.dart';
import 'package:e_commerce/domain/model/AuthenticationResultDto.dart';
import 'package:e_commerce/domain/repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/api_manager.dart';
import '../../domain/useCase/sign_up_useCase.dart';

class SignUpViewModel extends Cubit<SignUpViewState> {
  late ApiManager apiManager;
  late AuthenticationOnlineDataSource onlineDataSource;
  late AuthenticationRepository authenticationRepository;
  late SignUpUseCase signUpUseCase;

  SignUpViewModel() : super(InitialState()) {
    apiManager = ApiManager();
    onlineDataSource = AuthenticationOnlineDataSourceImplementation(apiManager);
    authenticationRepository =
        AuthenticationRepositoryImplementation(onlineDataSource);
    signUpUseCase = SignUpUseCase(authenticationRepository);
  }

  //todo: high dependence

  signUp(String fullName, String mobileNumber, String emailAddress,
      String password) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await signUpUseCase.invoke(
          fullName, mobileNumber, emailAddress, password);

      // if (!response.isSuccess()) {
      //   emit(FailState(failMessage: response.getErrorMessage()));
      //   return;
      // }
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
  AuthenticationResultDto response;

  SuccessState(this.response);
}

class FailState extends SignUpViewState {
  String? failMessage;

  FailState({this.failMessage});
}
