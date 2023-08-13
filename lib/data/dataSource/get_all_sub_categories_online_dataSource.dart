import 'package:e_commerce/data/api/api_manager.dart';

import '../../domain/dataSource/get_all_sub_categories_online_dataSource.dart';
import '../../domain/model/GetAllSubCategoriesDto.dart';

class GetAllSubCategoriesOnlineDataSourceImplementation
    implements GetAllSubCategoriesOnlineDataSource {
  ApiManager apiManager;

  GetAllSubCategoriesOnlineDataSourceImplementation(this.apiManager);

  @override
  Future<GetAllSubCategoriesDto> getAllSubCategories([String? id]) {
    return apiManager.getAllSubCategories(id);
  }
}
