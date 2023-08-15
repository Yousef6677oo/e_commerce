import 'package:e_commerce/domain/model/GetAllCategoriesDto.dart';

import '../../domain/dataSource/get_all_categories_online_dataSource.dart';
import '../../domain/repository/get_all_categories_repository.dart';

class GetAllCategoriesRepositoryImplementation
    implements GetAllCategoriesRepository {
  GetAllCategoriesOnlineDataSource onlineDataSource;

  GetAllCategoriesRepositoryImplementation(this.onlineDataSource);

  @override
  Future<GetAllCategoriesDto> getAllCategories([String? id]) {
    return onlineDataSource.getAllCategories();
  }
}
