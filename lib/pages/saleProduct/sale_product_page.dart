import 'package:ThikaThani/models/product.dart';
import 'package:ThikaThani/pages/detailProduct/detail_product_page.dart';
import 'package:ThikaThani/values/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaleProductPage extends StatefulWidget {
  final Product product;

  const SaleProductPage({Key key, @required this.product}) : super(key: key);

  @override
  _SaleProductPageState createState() => _SaleProductPageState(product);
}

class _SaleProductPageState extends State<SaleProductPage> {
  Product product;
  int _quantity = 0;
  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity >= 1) {
        _quantity--;
      }
    });
  }

  /*Product producto2 = Product(
      name: "Bebida Super saludable andino",
      imgUri: "assets/images/producto1.png",
      price: "16.00");*/
  _SaleProductPageState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/icons/header.png',
                width: 800,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  productInfo(product),
                  Row(children: [
                    Expanded(child: cardDetailProduct("INFORMACIÓN", ""))
                  ]),
                  Row(children: [
                    Expanded(
                      child: cardDetailProduct("SALUDABLE", ""),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                        child: cardDetailProduct("MARCAS Y PRODUCCIÓN", ""))
                  ]),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/icons/footer.png',
                width: 800,
                fit: BoxFit.fitWidth,
              ),
            )
          ],
        ),
      ),
    );
  }

  Card productInfo(Product product) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Material(
              elevation: 10,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                product.imgUri,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox.fromSize(
              size: Size(10, 0),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        product.name,
                        style: TextStyle(
                            color: MyColors.primaryColor, fontSize: 14),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size(0, 5),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "S/. ${product.price}",
                        style: TextStyle(
                            color: MyColors.primaryColor, fontSize: 18),
                      ),
                    ),
                    SizedBox.fromSize(
                      size: Size(0, 10),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cantidad",
                        style: TextStyle(
                            color: MyColors.primaryColor, fontSize: 12),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          CupertinoButton(
                              child: Image.asset(
                                "assets/images/remove.png",
                                width: 25,
                              ),
                              onPressed: () => _decreaseQuantity()),
                          Text("$_quantity"),
                          /*
                        IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: MyColors.primaryColor,
                            ),
                            onPressed: null),*/
                          CupertinoButton(
                              child: Image.asset(
                                "assets/images/add.png",
                                width: 25,
                              ),
                              onPressed: () => _increaseQuantity())
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card cardDetailProduct(String title, String subtitle) {
    return Card(
      color: MyColors.cardColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: "KGBrokeVesselSketch",
                    color: MyColors.primaryColor,
                    fontSize: 16),
              ),
            ),
            SizedBox.fromSize(
              size: Size(0, 10),
            ),
            Text(
              subtitle,
              style: TextStyle(color: MyColors.primaryColor, fontSize: 12),
            ),
            SizedBox.fromSize(
              size: Size(0, 50),
            ),
          ],
        ),
      ),
    );
  }
}
