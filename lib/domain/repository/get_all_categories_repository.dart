import '../model/GetAllCategoriesDto.dart';

abstract class GetAllCategoriesRepository {
  Future<GetAllCategoriesDto> getAllCategories([String? id]);
}
