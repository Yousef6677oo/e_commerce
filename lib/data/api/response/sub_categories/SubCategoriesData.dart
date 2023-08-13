import '../../../../domain/model/SubCategoriesDataDto.dart';

class SubCategoriesData {
  SubCategoriesData({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  SubCategoriesData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  SubCategoriesDataDto toSubCategoriesDataDto() {
    return SubCategoriesDataDto(
        id: id,
        name: name,
        slug: slug,
        category: category,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }
}
