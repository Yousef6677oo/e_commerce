import 'package:e_commerce/domain/model/GetAllSubCategoriesDto.dart';
import 'package:e_commerce/domain/repository/get_all_sub_categories_repository.dart';

class GetAllSubCategoriesUseCase {
  GetAllSubCategoriesRepository getAllSubCategoriesRepository;

  GetAllSubCategoriesUseCase(this.getAllSubCategoriesRepository);

  Future<GetAllSubCategoriesDto> invoke([String? id]) async {
    return await getAllSubCategoriesRepository.getAllSubCategories(id);
  }
}
