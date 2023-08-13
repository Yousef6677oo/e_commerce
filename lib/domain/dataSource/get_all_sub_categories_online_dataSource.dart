import 'package:e_commerce/domain/model/GetAllSubCategoriesDto.dart';

abstract class GetAllSubCategoriesOnlineDataSource {
  Future<GetAllSubCategoriesDto> getAllSubCategories([String? id]);
}
