import 'package:e_commerce/domain/model/DataDto.dart';
import 'package:e_commerce/domain/model/MetadataDto.dart';

class GetAllCategoriesDto {
  GetAllCategoriesDto({
    this.results,
    this.metadata,
    this.data,
  });

  int? results;
  CategoriesMetadataDto? metadata;
  List<CategoriesDataDto>? data;
}
