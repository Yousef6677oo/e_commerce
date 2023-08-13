import 'package:e_commerce/domain/model/GetAllSubCategoriesDto.dart';

abstract class GetAllSubCategoriesOnCategoryOnlineDataSource {
  Future<GetAllSubCategoriesDto> getAllSubCategoriesOnCategory(String id);
}
