import 'SubCategoriesDataDto.dart';
import 'SubCategoriesMetaDataDto.dart';

class GetAllSubCategoriesDto {
  GetAllSubCategoriesDto({
    this.results,
    this.metadata,
    this.data,
  });

  int? results;
  SubCategoriesMetaDataDto? metadata;
  List<SubCategoriesDataDto>? data;
}
