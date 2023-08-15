import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/dataSource/get_all_sub_categories_online_dataSource.dart';
import 'package:e_commerce/data/repository/get_all_sub_categories_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/dataSource/get_all_categories_online_dataSource.dart';
import '../../../../data/dataSource/get_all_sub_categories_on_category_online_dataSource.dart';
import '../../../../data/repository/get_all_categories_repository.dart';
import '../../../../data/repository/get_all_sub_categories_on_category_repository.dart';
import '../../../../domain/dataSource/get_all_categories_online_dataSource.dart';
import '../../../../domain/dataSource/get_all_sub_categories_on_category_online_dataSource.dart';
import '../../../../domain/dataSource/get_all_sub_categories_online_dataSource.dart';
import '../../../../domain/model/DataDto.dart';
import '../../../../domain/model/GetAllCategoriesDto.dart';
import '../../../../domain/model/GetAllSubCategoriesDto.dart';
import '../../../../domain/model/SubCategoriesDataDto.dart';
import '../../../../domain/repository/get_all_categories_repository.dart';
import '../../../../domain/repository/get_all_sub_categories_on_category_repository.dart';
import '../../../../domain/repository/get_all_sub_categories_repository.dart';
import '../../../../domain/useCase/get_all_categories_useCase.dart';
import '../../../../domain/useCase/get_all_sub_categories_on_category_useCase.dart';
import '../../../../domain/useCase/get_all_sub_categories_useCase.dart';

class CategoriesViewModel extends Cubit<CategoriesViewState> {
  late ApiManager apiManager;

  ////////////////////////////////////////////////////////////////////////////
  late GetAllSubCategoriesOnlineDataSource getAllSubCategoriesOnlineDataSource;
  late GetAllSubCategoriesRepository getAllSubCategoriesRepository;
  late GetAllSubCategoriesUseCase getAllSubCategoriesUseCase;

  ////////////////////////////////////////////////////////////////////////////
  late GetAllSubCategoriesOnCategoryOnlineDataSource
      getAllSubCategoriesOnCategoryOnlineDataSource;
  late GetAllSubCategoriesOnCategoryRepository
      getAllSubCategoriesOnCategoryRepository;
  late GetAllSubCategoriesOnCategoryUseCase
      getAllSubCategoriesOnCategoryUseCase;

  ///////////////////////////////////////////////////////////////////////////
  late GetAllCategoriesOnlineDataSource onlineDataSource;
  late GetAllCategoriesRepository getAllCategoriesRepository;
  late GetAllCategoriesUseCase getAllCategoriesUseCase;

  ///////////////////////////////////////////////////////////////////////////
  CategoriesViewModel() : super(InitialState()) {
    apiManager = ApiManager();
    getAllSubCategoriesOnlineDataSource =
        GetAllSubCategoriesOnlineDataSourceImplementation(apiManager);
    getAllSubCategoriesRepository = GetAllSubCategoriesRepositoryImplementation(
        getAllSubCategoriesOnlineDataSource);
    getAllSubCategoriesUseCase =
        GetAllSubCategoriesUseCase(getAllSubCategoriesRepository);
    ////////////////////////////////////////////////////////////////////////////
    getAllSubCategoriesOnCategoryOnlineDataSource =
        GetAllSubCategoriesOnCategoryOnlineDataSourceImplementation(apiManager);
    getAllSubCategoriesOnCategoryRepository =
        GetAllSubCategoriesOnCategoryRepositoryImplementation(
            getAllSubCategoriesOnCategoryOnlineDataSource);
    getAllSubCategoriesOnCategoryUseCase = GetAllSubCategoriesOnCategoryUseCase(
        getAllSubCategoriesOnCategoryRepository);
    ///////////////////////////////////////////////////////////////////////////
    onlineDataSource =
        GetAllCategoriesOnlineDataSourceImplementation(apiManager);
    getAllCategoriesRepository =
        GetAllCategoriesRepositoryImplementation(onlineDataSource);
    getAllCategoriesUseCase =
        GetAllCategoriesUseCase(getAllCategoriesRepository);
  }

  Future<List<SubCategoriesDataDto>?> getAllSubCategories([String? id]) async {
    emit(LoadingState(loadingMessage: 'Loading...'));
    try {
      var response = await getAllSubCategoriesUseCase.invoke();
      // if (!response.isSuccess()) {
      //   emit(FailState(failMessage: response.getErrorMessage()));
      //   return;
      // }
      emit(SuccessGetAllSubCategoriesState(response));
      return response.data;
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }

  Future<List<SubCategoriesDataDto>?> getSubCategoriesOnCategory(String id) async {
    emit(LoadingState(loadingMessage: 'Loading...'));
    try {
      var response = await getAllSubCategoriesOnCategoryUseCase.invoke(id);
      // if (!response.isSuccess()) {
      //   emit(FailState(failMessage: response.getErrorMessage()));
      //   return;
      // }
      emit(SuccessGetAllSubCategoriesOnCategoryState(response));
      return response.data;
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }

  Future<List<CategoriesDataDto>?> getSpecificCategories(String id) async {
    print("id_4: $id");
    emit(LoadingState(loadingMessage: 'Loading...'));
    try {
      var response = await getAllCategoriesUseCase.invoke(id);
      // if (!response.isSuccess()) {
      //   emit(FailState(failMessage: response.getErrorMessage()));
      //   return;
      // }
      emit(SuccessGetSpecificCategories(response));
      return response.data;
    } catch (exception) {
      emit(FailState(failMessage: exception.toString()));
    }
  }
}

abstract class CategoriesViewState {}

class InitialState extends CategoriesViewState {}

class LoadingState extends CategoriesViewState {
  String? loadingMessage;

  LoadingState({this.loadingMessage});
}

class SuccessGetAllSubCategoriesState extends CategoriesViewState {
  GetAllSubCategoriesDto response;

  SuccessGetAllSubCategoriesState(this.response);
}

class SuccessGetAllSubCategoriesOnCategoryState extends CategoriesViewState {
  GetAllSubCategoriesDto response;

  SuccessGetAllSubCategoriesOnCategoryState(this.response);
}

class SuccessGetSpecificCategories extends CategoriesViewState {
  GetAllCategoriesDto response;

  SuccessGetSpecificCategories(this.response);
}

class FailState extends CategoriesViewState {
  String? failMessage;

  FailState({this.failMessage});
}
