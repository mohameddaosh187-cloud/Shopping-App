import 'package:shopping_app/core/constants/constants_value.dart';

class ProductsListEntity {
  List<ProductEntity> list;
  int total;
  int skip;
  int limit;

  ProductsListEntity({
    this.list = const [],
    this.total = 10,
    this.skip = 1,
    this.limit = 5,
  });
}

class ProductEntity {
  int id;
  String title;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  List<String> images;

  ProductEntity({
    this.id = 0,
    this.title = "title",
    this.price = 10,
    this.discountPercentage = 9,
    this.rating = 4.0,
    this.stock = 0,
    this.images = const [ConstantsValue.image],
  });
}
