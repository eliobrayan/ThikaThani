import 'package:ThikaThani/pages/detailProduct/detail_product_page.dart';
import 'package:ThikaThani/values/my_colors.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final List<String> imgListCard1 = [
    'assets/images/producto1.png',
    'assets/images/producto2.png',
    'assets/images/producto3.png'
  ];
  final List<String> imgListCard2 = [
    'assets/images/producto4.png',
    'assets/images/producto5.png',
    'assets/images/producto6.png',
    'assets/images/producto7.png'
  ];
  final List<String> labelListCard1 = [
    'Superalimentos\n andinos',
    'Complementos',
    'Suplementos'
  ];
  final List<String> labelListCard2 = [
    'Jabones naturales',
    'Aceites esenciales \n& cremas humectantes ',
    'Cosmetica Natural',
    'Cuidado Natural'
  ];
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "THIKA THANI FARMACIA",
                    style: TextStyle(
                        fontFamily: "KGBrokeVesselSketch",
                        color: MyColors.purpleText,
                        fontSize: 26),
                  ),
                ),
                card(
                    "SUPER ALIMENTOS ANDINOS, COMPLEMENTOS Y SUPLEMENTOS NUTRICIONALES",
                    imgListCard1,
                    labelListCard1,
                    "category1"),
                card("COSMÉTICA NATURAL Y CUIDADO PERSONAL", imgListCard2,
                    labelListCard2, "category2"),
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
      )),
    );
  }

  void showCategory(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailProductPage(category: category)),
    );
  }

  Expanded imageWidthTitle(String nameImage, String label) {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Image.asset(
              nameImage,
              width: 80,
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 7,
                      fontWeight: FontWeight.w400,
                      color: MyColors.hintColor)),
            )
          ],
        ),
      ),
    );
  }

  Card card(
      String title, List<String> imgs, List<String> labels, String category) {
    return Card(
      color: MyColors.backgroundLogin,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: InkWell(
        onTap: () => showCategory(category),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: "KGBrokeVesselSketch",
                      color: MyColors.purpleText,
                      fontSize: 12),
                ),
                SizedBox.fromSize(
                  size: Size(0, 10),
                ),
                Row(
                    children: imgs.map<Widget>((e) {
                  print(e);
                  var index = imgs.indexOf(e);
                  return imageWidthTitle(e, labels[index]);
                }).toList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
