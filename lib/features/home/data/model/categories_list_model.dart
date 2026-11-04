class CategoriesList {
  List<CategoryModel>? list;

  CategoriesList({this.list});

  CategoriesList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <CategoryModel>[];
      json['list'].forEach((v) {
        list!.add(CategoryModel.fromJson(v));
      });
    }
  }
}

class CategoryModel {
  String? slug;
  String? name;

  CategoryModel({this.slug, this.name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
  }
}
