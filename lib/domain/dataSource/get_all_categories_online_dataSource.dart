import 'package:e_commerce/domain/model/GetAllCategoriesDto.dart';

abstract class GetAllCategoriesOnlineDataSource {
  Future<GetAllCategoriesDto> getAllCategories([String? id]);
}
