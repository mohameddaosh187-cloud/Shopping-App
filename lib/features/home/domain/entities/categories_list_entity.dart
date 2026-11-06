class CategoriesListEntity {
  List<CategoryEntity> list;

  CategoriesListEntity({this.list = const []});
}

class CategoryEntity {
  String slug;
  String name;

  CategoryEntity({this.slug = "slug", this.name = "name"});
}
