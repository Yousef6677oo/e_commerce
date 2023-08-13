import '../../../../domain/model/GetAllSubCategoriesDto.dart';
import 'SubCategoriesData.dart';
import 'SubCategoriesMetaData.dart';

class GetAllSubCategoriesResponse {
  GetAllSubCategoriesResponse({
    this.results,
    this.metadata,
    this.data,
  });

  GetAllSubCategoriesResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? SubCategoriesMetaData.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SubCategoriesData.fromJson(v));
      });
    }
  }

  int? results;
  SubCategoriesMetaData? metadata;
  List<SubCategoriesData>? data;

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

  GetAllSubCategoriesDto toGetAllSubCategoriesDto() {
    return GetAllSubCategoriesDto(
        results: results,
        metadata: metadata?.toSubCategoriesMetaDataDto(),
        data: data!.map((element) {
          return element.toSubCategoriesDataDto();
        }).toList());
  }
}
