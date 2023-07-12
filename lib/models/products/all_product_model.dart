class AllProductModel {
  final List<Products> products;

  AllProductModel({required this.products});

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
          products: List<Products>.from(
              (json['products'] as List).map((e) => Products.fromJson(e))));
}

class Products {
  final String id;
  final String title;
  final String price;
  final String cat;
  final String img;

  Products(
      {required this.id,
      required this.title,
      required this.price,
      required this.cat,
      required this.img});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
      id: json['id'].toString(),
      cat: json['category'],
      img: json['thumbnail'],
      price: json['price'].toString(),
      title: json['title']);
}


// "products": [
//     {
//       "id": 1,
//       "title": "iPhone 9",
//       "description": "An apple mobile which is nothing like apple",
//       "price": 549,
//       "discountPercentage": 12.96,
//       "rating": 4.69,
//       "stock": 94,
//       "brand": "Apple",
//       "category": "smartphones",
//       "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
//       "images": [
//         "https://i.dummyjson.com/data/products/1/1.jpg",
//         "https://i.dummyjson.com/data/products/1/2.jpg",
//         "https://i.dummyjson.com/data/products/1/3.jpg",
//         "https://i.dummyjson.com/data/products/1/4.jpg",
//         "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
//       ]
//     }