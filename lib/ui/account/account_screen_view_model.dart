import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreenViewModel extends Cubit<AccountScreenViewState> {
  AccountScreenViewModel() : super(InitialState());
}

abstract class AccountScreenViewState {}

class InitialState extends AccountScreenViewState {}

class LoadingState extends AccountScreenViewState {
  String? loadingMessage;
  LoadingState({this.loadingMessage});
}

class SuccessState extends AccountScreenViewState {}

class FailState extends AccountScreenViewState {
  String? failMessage;

  FailState({this.failMessage});
}
