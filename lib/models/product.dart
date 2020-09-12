import 'package:meta/meta.dart';

class Product {
  final String name;
  final String imgUri;
  final String price;

  Product({@required this.name, @required this.imgUri, @required this.price});

  factory Product.fromMap(dynamic data) => Product(
        name: data["name"],
        imgUri: data["imgUri"],
        price: data["price"],
      );
}
