import 'package:e_commerce/domain/model/GetAllSubCategoriesDto.dart';
import 'package:e_commerce/domain/repository/get_all_sub_categories_repository.dart';

import '../repository/get_all_sub_categories_on_category_repository.dart';

class GetAllSubCategoriesOnCategoryUseCase {
  GetAllSubCategoriesOnCategoryRepository getAllSubCategoriesOnCategoryRepository;

  GetAllSubCategoriesOnCategoryUseCase(this.getAllSubCategoriesOnCategoryRepository);

  Future<GetAllSubCategoriesDto> invoke(String id) async {
    return await getAllSubCategoriesOnCategoryRepository.getAllSubCategoriesOnCategory(id);
  }
}
