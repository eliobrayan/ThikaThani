import 'package:ThikaThani/models/product.dart';
import 'package:ThikaThani/pages/saleProduct/sale_product_page.dart';
import 'package:ThikaThani/values/my_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatefulWidget {
  final String category;

  const DetailProductPage({Key key, this.category}) : super(key: key);
  @override
  _DetailProductPageState createState() => _DetailProductPageState(category);
}

class _DetailProductPageState extends State<DetailProductPage> {
  String category;
  _DetailProductPageState(this.category);
  final List<Product> category1List = [
    Product(
        name: "Ecoandino Quinua Gelatinizada 250G",
        imgUri: "assets/images/product1Cat1.png",
        price: "16.70"),
    Product(
        name: "Kroken Mix de oro 500G",
        imgUri: "assets/images/product2Cat1.png",
        price: "16.70"),
    Product(
        name: "Ecoandino Algarrobo en polvo 250G",
        imgUri: "assets/images/product3Cat1.png",
        price: "16.70"),
    Product(
        name: "America Organica Quinua Tricolor 340G",
        imgUri: "assets/images/product4Cat1.png",
        price: "17.70"),
    Product(
        name: "Nutri Mix Vigor 200G",
        imgUri: "assets/images/product5Cat1.png",
        price: "16.90")
  ];
  final List<Product> category2List = [
    Product(
        name: "CREMA CORPORAL CON ARGAN 400ML NATUMAROC",
        imgUri: "assets/images/product1Cat2.jpg",
        price: "59.00"),
    Product(
        name: "SAL DE MARAS AROMATICAS MARACUYA 85G ROSA TORO",
        imgUri: "assets/images/product2Cat2.jpg",
        price: "34.90"),
    Product(
        name: "CREMA FACIAL ANTI ARRUGAS Y MANCHAS 60G LA BOTICA",
        imgUri: "assets/images/product3Cat2.png",
        price: "42.00"),
    Product(
        name: "HOJAS DE NEEM DESHIDRATADAS 9G CHIA PERU",
        imgUri: "assets/images/product4Cat2.jpg",
        price: "7.00"),
    Product(
        name: "ACEITE DE ROSA MOSQUETA 30ML TERRA AMAZONAS",
        imgUri: "assets/images/product5Cat2.jpg",
        price: "44.90"),
  ];
  @override
  Widget build(BuildContext context) {
    List<Product> currentList = List<Product>();
    if (category == "category1") {
      currentList = category1List;
    } else if (category == "category2") {
      currentList = category2List;
    }
    print(category);
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Container(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/icons/header.png',
            width: 800,
            fit: BoxFit.fitWidth,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Text(
                "Super Alimentos Andinos",
                style: TextStyle(
                    fontFamily: "KGBrokeVesselSketch",
                    color: MyColors.primaryColor,
                    fontSize: 16),
              ),
              SizedBox.fromSize(
                size: Size(0, 20),
              ),
              Divider(
                color: MyColors.primaryColor,
                indent: 50,
                endIndent: 50,
                thickness: 1.5,
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 20),
              itemCount: currentList.length,
              itemBuilder: (_, index) =>
                  cardProduct(currentList[index], context)),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/icons/footer.png',
            width: 800,
            fit: BoxFit.fitWidth,
          ),
        )
      ])),
    );
  }
}

sendProduct(Product product, BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SaleProductPage(product: product)),
  );
}

Card cardProduct(Product product, BuildContext context) {
  return Card(
    elevation: 0,
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
            child: Text(
              product.name,
              style: TextStyle(color: MyColors.primaryColor, fontSize: 14),
            ),
          ),
          Column(
            children: [
              Text(
                "S/. ${product.price}",
                style: TextStyle(color: MyColors.primaryColor, fontSize: 14),
              ),
              CupertinoButton(
                  child: Image.asset(
                    "assets/images/add.png",
                    width: 25,
                  ),
                  onPressed: () => sendProduct(product, context)),
            ],
          )
        ],
      ),
    ),
  );
}
