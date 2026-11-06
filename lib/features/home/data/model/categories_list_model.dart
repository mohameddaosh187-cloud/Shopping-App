import 'package:shopping_app/features/home/domain/entities/categories_list_entity.dart';

class CategoriesListDto {
  List<CategoryDto>? list;

  CategoriesListDto({this.list});

  CategoriesListDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <CategoryDto>[];
      json['list'].forEach((v) {
        list!.add(CategoryDto.fromJson(v));
      });
    }
  }
  // toEntity
  CategoriesListEntity toEntity() {
    return CategoriesListEntity(
      list: list?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

class CategoryDto {
  String? slug;
  String? name;

  CategoryDto({this.slug, this.name});

  CategoryDto.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
  }
  // toEntity
  CategoryEntity toEntity() {
    return CategoryEntity(name: name ?? "", slug: slug ?? "");
  }
}
