import '../../domain/dataSource/get_all_sub_categories_on_category_online_dataSource.dart';
import '../../domain/model/GetAllSubCategoriesDto.dart';
import '../../domain/repository/get_all_sub_categories_on_category_repository.dart';
import '../../domain/repository/get_all_sub_categories_repository.dart';

class GetAllSubCategoriesOnCategoryRepositoryImplementation
    implements GetAllSubCategoriesOnCategoryRepository {
  GetAllSubCategoriesOnCategoryOnlineDataSource onlineDataSource;

  GetAllSubCategoriesOnCategoryRepositoryImplementation(this.onlineDataSource);

  @override
  Future<GetAllSubCategoriesDto> getAllSubCategoriesOnCategory(String id) {
   return onlineDataSource.getAllSubCategoriesOnCategory(id);

  }
}
