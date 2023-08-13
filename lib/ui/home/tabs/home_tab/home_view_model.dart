import 'package:e_commerce/data/dataSource/get_all_categories_online_dataSource.dart';
import 'package:e_commerce/data/repository/get_all_categories_repository.dart';
import 'package:e_commerce/domain/dataSource/get_all_categories_online_dataSource.dart';
import 'package:e_commerce/domain/model/GetAllCategoriesDto.dart';
import 'package:e_commerce/domain/repository/get_all_categories_repository.dart';
import 'package:e_commerce/domain/useCase/get_all_categories_useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/api/api_manager.dart';
import '../../../../domain/model/DataDto.dart';

class HomeViewModel extends Cubit<HomeViewState> {
  late ApiManager apiManager;
  late GetAllCategoriesOnlineDataSource onlineDataSource;
  late GetAllCategoriesRepository getAllCategoriesRepository;
  late GetAllCategoriesUseCase getAllCategoriesUseCase;

  HomeViewModel() : super(InitialState()) {
    apiManager = ApiManager();
    onlineDataSource =
        GetAllCategoriesOnlineDataSourceImplementation(apiManager);
    getAllCategoriesRepository =
        GetAllCategoriesRepositoryImplementation(onlineDataSource);
    getAllCategoriesUseCase =
        GetAllCategoriesUseCase(getAllCategoriesRepository);
  }

  Future<List<CategoriesDataDto>?> getAllCategories() async {
    emit(LoadingState(loadingMessage: 'Loading...'));
    try {
      var response = await getAllCategoriesUseCase.invoke();
      // if (!response.isSuccess()) {
      //   emit(FailState(failMessage: response.getErrorMessage()));
      //   return;
      // }
      emit(SuccessState(response));
      return response.data;
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }
}

abstract class HomeViewState {}

class InitialState extends HomeViewState {}

class LoadingState extends HomeViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class SuccessState extends HomeViewState {
  GetAllCategoriesDto response;

  SuccessState(this.response);
}

class FailState extends HomeViewState {
  String? failMessage;

  FailState({this.failMessage});
}
