import 'package:shopping_app/features/home/domain/entities/products_list_entity.dart';

class ProductsListDto {
  List<ProductDto>? list;
  int? total;
  int? skip;
  int? limit;

  ProductsListDto({this.list, this.total, this.skip, this.limit});

  ProductsListDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ProductDto>[];
      json['list'].forEach((v) {
        list!.add(ProductDto.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  // toEntity
  ProductsListEntity toEntity() {
    return ProductsListEntity(
      list: list?.map((e) => e.toEntity()).toList() ?? [],
      total: total ?? 0,
      skip: skip ?? 0,
      limit: limit ?? 0,
    );
  }
}

class ProductDto {
  int? id;
  String? title;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? images;

  ProductDto({
    this.id,
    this.title,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.images,
  });

  ProductDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    images = json['images'].cast<String>();
  }
  // toentity
  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      title: title ?? "",
      price: price ?? 0,
      discountPercentage: discountPercentage ?? 0,
      rating: rating ?? 0,
      stock: stock ?? 0,
      images: images ?? [],
    );
  }
}
