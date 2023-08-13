import '../../../../domain/model/MetadataDto.dart';

class CategoriesMetaData {
  CategoriesMetaData({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  CategoriesMetaData.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

  CategoriesMetadataDto toCategoriesMetadataDto() {
    return CategoriesMetadataDto(
        currentPage: currentPage, numberOfPages: numberOfPages, limit: limit);
  }
}
