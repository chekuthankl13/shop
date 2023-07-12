class SIngleProducts {
  final String id;
  final String title;
  final String price;
  final String descr;
  final String brand;
  final String cat;
  final String stock;
  final String discout;
  final List imgs;

  SIngleProducts(
      {required this.id,
      required this.title,
      required this.price,
      required this.descr,
      required this.brand,
      required this.cat,
      required this.stock,
      required this.discout,
      required this.imgs});

  factory SIngleProducts.fromJson(Map<String, dynamic> json) => SIngleProducts(
      id: json['id'].toString(),
      title: json['title'],
      price: json['price'].toString(),
      descr: json['description'],
      brand: json['brand'],
      cat: json['category'],
      stock: json['stock'].toString(),
      discout: json['discountPercentage'].toString(),
      imgs: json['images']);
}

// {
//   "id": 1,
//   "title": "iPhone 9",
//   "description": "An apple mobile which is nothing like apple",
//   "price": 549,
//   "discountPercentage": 12.96,
//   "rating": 4.69,
//   "stock": 94,
//   "brand": "Apple",
//   "category": "smartphones",
//   "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
//   "images": [
//     "https://i.dummyjson.com/data/products/1/1.jpg",
//     "https://i.dummyjson.com/data/products/1/2.jpg",
//     "https://i.dummyjson.com/data/products/1/3.jpg",
//     "https://i.dummyjson.com/data/products/1/4.jpg",
//     "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
//   ]
// }