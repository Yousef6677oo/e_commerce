import '../../domain/dataSource/get_all_sub_categories_online_dataSource.dart';
import '../../domain/model/GetAllSubCategoriesDto.dart';
import '../../domain/repository/get_all_sub_categories_repository.dart';

class GetAllSubCategoriesRepositoryImplementation
    implements GetAllSubCategoriesRepository {
  GetAllSubCategoriesOnlineDataSource onlineDataSource;

  GetAllSubCategoriesRepositoryImplementation(this.onlineDataSource);

  @override
  Future<GetAllSubCategoriesDto> getAllSubCategories([String? id]) {
    return onlineDataSource.getAllSubCategories(id);
  }
}
