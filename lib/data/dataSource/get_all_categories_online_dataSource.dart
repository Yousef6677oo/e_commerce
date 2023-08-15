import 'package:e_commerce/domain/dataSource/get_all_categories_online_dataSource.dart';
import 'package:e_commerce/domain/model/GetAllCategoriesDto.dart';

import '../api/api_manager.dart';

class GetAllCategoriesOnlineDataSourceImplementation
    implements GetAllCategoriesOnlineDataSource {
  ApiManager apiManager;

  GetAllCategoriesOnlineDataSourceImplementation(this.apiManager);

  @override
  Future<GetAllCategoriesDto> getAllCategories([String? id]) {
      return apiManager.getAllCategories(id);
  }
}
