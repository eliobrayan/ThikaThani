import 'package:ThikaThani/Pages/cardsPage.dart/card_page.dart';
import 'package:ThikaThani/values/my_colors.dart';
import 'package:ThikaThani/values/thika_thani_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'assets/images/product1Cat1.png',
  'assets/images/product2Cat1.png',
  'assets/images/product3Cat1.png',
  'assets/images/product4Cat1.png',
  'assets/images/product5Cat1.png'
];

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController _controller;
  final itemSize = 100.0;
  _moveLeft() {
    //_controller.jumpTo(_controller.offset - itemSize);
    _controller.animateTo(_controller.offset - itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  _moveRight() {
    //_controller.jumpTo(_controller.offset + itemSize);
    _controller.animateTo(_controller.offset + itemSize,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    Widget buttonMenu = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconMenu(ThikaThani.cart, MyColors.primaryColor, 30),
          iconMenu(ThikaThani.gift, MyColors.primaryColor, 30),
          iconMenu(ThikaThani.person, MyColors.primaryColor, 30),
        ],
      ),
    );
    _controller = ScrollController();
    return Scaffold(
      body: SafeArea(
        child: Center(
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

              /*CupertinoButton(
                  child: Icon(Icons.close), onPressed: () => print("object")),*/
              Expanded(
                child: Container(
                  child: ListView(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    //**mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox.fromSize(
                        size: Size(0, 20),
                      ),
                      buttonMenu,
                      search(),
                      Stack(children: [
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/icons/options_market.png',
                            width: 350,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 150, top: 100),
                          child: FlatButton(
                              color: MyColors.transparent,
                              child: Icon(null),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CardPage()),
                                );
                              }),
                        ),
                      ]),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "PRODUCTOS DESTACADOS",
                            style: TextStyle(
                                fontFamily: "KGBrokeVesselSketch",
                                color: MyColors.primaryColor),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              icon: Icon(
                                ThikaThani.arrow_left1,
                                color: MyColors.primaryColor,
                              ),
                              onPressed: _moveLeft),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: 250, maxHeight: 100),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  controller: _controller,
                                  physics: ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imgList.length,
                                  itemBuilder: (_, index) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Material(
                                        elevation: 10,
                                        color: MyColors.listImagesColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                          imgList[index],
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          IconButton(
                              icon: Icon(ThikaThani.arrow_right,
                                  color: MyColors.primaryColor),
                              onPressed: _moveRight)
                        ],
                      ),

                      /*Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 10),
                          child: CarouselSlider(
                            options: CarouselOptions(),
                            items: imgList
                                .map((item) => Container(
                                        child: Material(
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.asset(
                                        item,
                                        width: 80,
                                        height: 80,
                                        //fit: BoxFit.cover,
                                      ),
                                    )))
                                .toList(),
                          )),*/
                    ],
                  ),
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
      ),
    );
  }

  Container search() {
    return Container(
        height: 30,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: MyColors.searchBoxColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            Icon(
              ThikaThani.search,
              color: MyColors.primaryColor,
            ),
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(),
              ),
            ),
          ],
        ));
  }

  Icon iconMenu(IconData icon, Color color, double size) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
