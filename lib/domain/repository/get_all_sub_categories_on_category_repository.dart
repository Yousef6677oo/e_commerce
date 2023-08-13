import 'package:e_commerce/domain/model/GetAllSubCategoriesDto.dart';

abstract class GetAllSubCategoriesOnCategoryRepository {
  Future<GetAllSubCategoriesDto> getAllSubCategoriesOnCategory(String id);
}
