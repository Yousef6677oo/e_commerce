import '../../../../domain/model/DataDto.dart';

class CategoriesData {
  CategoriesData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  CategoriesData.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

  CategoriesDataDto toCategoriesDataDto() {
    return CategoriesDataDto(
        id: id,
        name: name,
        slug: slug,
        image: image,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }
}
