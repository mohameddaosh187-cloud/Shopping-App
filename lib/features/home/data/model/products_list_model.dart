class ProductsList {
  List<ProductModel>? list;
  int? total;
  int? skip;
  int? limit;

  ProductsList({this.list, this.total, this.skip, this.limit});

  ProductsList.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ProductModel>[];
      json['list'].forEach((v) {
        list!.add(ProductModel.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class ProductModel {
  int? id;
  String? title;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? images;
  String? thumbnail;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.images,
    this.thumbnail,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    images = json['images'].cast<String>();
  }
}
