import 'package:e_commerce/data/dataSource/authentication_online_dataSource.dart';
import 'package:e_commerce/data/repository/authentication_repository.dart';
import 'package:e_commerce/domain/dataSource/authentication_online_dataSource.dart';
import 'package:e_commerce/domain/model/AuthenticationResultDto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api/api_manager.dart';
import '../../domain/repository/authentication_repository.dart';
import '../../domain/useCase/sign_in_useCase.dart';

class SignInViewModel extends Cubit<SignInViewState> {
  late ApiManager apiManager;
  late AuthenticationOnlineDataSource onlineDataSource;
  late AuthenticationRepository authenticationRepository;
  late SignInUseCase signInUseCase;

  SignInViewModel() : super(InitialState()) {
    apiManager = ApiManager();
    onlineDataSource = AuthenticationOnlineDataSourceImplementation(apiManager);
    authenticationRepository =
        AuthenticationRepositoryImplementation(onlineDataSource);
    signInUseCase = SignInUseCase(authenticationRepository);
  }

  //todo: high dependence

  signIn(String userName, String password) async {
    emit(LoadingState(loadingMessage: "Loading..."));
    try {
      var response = await signInUseCase.invoke(userName, password);
      // if (!response.isSuccess()) {
      //   emit(FailState(failMessage: response.getErrorMessage()));
      //   return;
      // }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('name', response.user?.name ?? '');
      await prefs.setString('email', response.user?.email ?? '');
      await prefs.setString('token', response.token ?? '');
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
  AuthenticationResultDto response;

  SuccessState(this.response);
}

class FailState extends SignInViewState {
  String? failMessage;

  FailState({this.failMessage});
}
