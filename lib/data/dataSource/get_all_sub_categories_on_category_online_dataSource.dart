import 'package:e_commerce/data/api/api_manager.dart';
import '../../domain/dataSource/get_all_sub_categories_on_category_online_dataSource.dart';
import '../../domain/model/GetAllSubCategoriesDto.dart';

class GetAllSubCategoriesOnCategoryOnlineDataSourceImplementation
    implements GetAllSubCategoriesOnCategoryOnlineDataSource {
  ApiManager apiManager;

  GetAllSubCategoriesOnCategoryOnlineDataSourceImplementation(this.apiManager);

  @override
  Future<GetAllSubCategoriesDto> getAllSubCategoriesOnCategory(String id) {
    return apiManager.getAllSubCategoriesOnCategory(id);
  }
}
