import 'package:e_commerce/domain/model/GetAllSubCategoriesDto.dart';

abstract class GetAllSubCategoriesRepository {
  Future<GetAllSubCategoriesDto> getAllSubCategories([String? id]);
}
