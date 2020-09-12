import 'package:ThikaThani/controllers/login_controller.dart';
import 'package:ThikaThani/pages/login/loginIcons.dart';
import 'package:ThikaThani/pages/main/main_page.dart';

import 'package:flutter/material.dart';
import 'package:ThikaThani/Values/thika_thani_icons.dart';
import 'package:ThikaThani/values/my_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();
  String email = "";
  String password = "";
  String error = "";

  final _formkey = GlobalKey<FormState>();
  var obscurePassword = true;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: loginForm(_formkey, context))),
      backgroundColor: MyColors.backgroundLogin,
    );
  }

  Widget loginForm(GlobalKey<FormState> key, BuildContext context) {
    return Stack(children: [
      Container(
        alignment: Alignment.topCenter,
        child: Image.asset(
          'assets/icons/header.png',
          width: 800,
          fit: BoxFit.fitWidth,
        ),
      ),
      Form(
        key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: flowerLeft,
                      ),
                      Flexible(
                        child: Text(
                          "INICIAR SESIÓN",
                          style: TextStyle(
                              fontFamily: "KGBrokeVesselSketch",
                              color: MyColors.secondaryColor,
                              fontSize: 32),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: flowerRight,
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 20), child: emailIcon),
                  Flexible(
                    child: TextFormField(
                      style: TextStyle(
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                          hintText: "Correo Electronico",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MyColors.primaryColor),
                          )),
                      validator: (value) =>
                          value.isEmpty ? "Ingrese un correo" : null,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) {
                        setState(() {
                          error = "";
                          email = val;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(right: 20), child: passwordIcon),
                  Flexible(
                    child: TextFormField(
                      style: TextStyle(
                        color: MyColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        hintText: "Contraseña",
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: MyColors.primaryColor)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? ThikaThani.password_hide
                                : ThikaThani.password_show,
                            color: MyColors.primaryColor,
                          ),
                          onPressed: _togglePassword,
                        ),
                      ),
                      obscureText: obscurePassword,
                      validator: (value) =>
                          value.length < 6 ? "Contraseña no válida" : null,
                      onChanged: (val) {
                        setState(() {
                          error = "";
                          password = val;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 80),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 13, horizontal: 50),
                onPressed: () async {
                  if (key.currentState.validate()) {
                    // If the form is valid, display a Snackbar.
                    bool success = await controller.singUp(email, password);
                    print(success);

                    if (!success) {
                      setState(() {
                        error = 'Sucedió un error';
                      });
                    } else {
                      setState(() {
                        error = "";
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    }
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.red)),
                color: MyColors.secondaryColor,
                child: Text("INICIAR SESIÓN"),
                textColor: Colors.white,
              ),
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            ),
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
    ]);
  }

  void _togglePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }
}
