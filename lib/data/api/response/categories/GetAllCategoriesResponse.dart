import '../../../../domain/model/GetAllCategoriesDto.dart';
import 'CategoriesData.dart';
import 'CategoriesMetaData.dart';

class GetAllCategoriesResponse {
  GetAllCategoriesResponse({
    this.results,
    this.metadata,
    this.data,
  });

  GetAllCategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? CategoriesMetaData.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoriesData.fromJson(v));
      });
    }
  }

  int? results;
  CategoriesMetaData? metadata;
  List<CategoriesData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  GetAllCategoriesDto toGetAllCategoriesDto() {
    return GetAllCategoriesDto(
        results: results,
        metadata: metadata?.toCategoriesMetadataDto(),
        data: data?.map((element) {
          return element.toCategoriesDataDto();
        }).toList());
  }
}
