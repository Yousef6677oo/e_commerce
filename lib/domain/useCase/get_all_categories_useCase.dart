import 'package:e_commerce/domain/model/GetAllCategoriesDto.dart';

import '../repository/get_all_categories_repository.dart';

class GetAllCategoriesUseCase {
  GetAllCategoriesRepository getAllCategoriesRepository;

  GetAllCategoriesUseCase(this.getAllCategoriesRepository);

  Future<GetAllCategoriesDto> invoke() async {
    return await getAllCategoriesRepository.getAllCategories();
  }
}
