import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ThikaThani/values/my_colors.dart';

Widget titleFlower = SvgPicture.asset(
  'assets/icons/login_title_flower.svg',
  //color: MyColors.secondaryColor,
  width: 50,
  height: 50,
);
Widget flowerLeft = SvgPicture.asset(
  'assets/icons/login_title_flower.svg',
  //color: MyColors.secondaryColor,
  width: 40,
  color: MyColors.secondaryColor,
  height: 40,
);
Widget flowerRight = SvgPicture.asset(
  'assets/icons/login_title_flower_right.svg',
  //color: MyColors.secondaryColor,
  width: 40,
  color: MyColors.secondaryColor,
  height: 40,
);
Widget passwordIcon = SvgPicture.asset(
  'assets/icons/login_input_password.svg',
  //color: MyColors.secondaryColor,
  width: 40,
  height: 40,
);
Widget emailIcon = SvgPicture.asset(
  'assets/icons/login_input_email.svg',
  //color: MyColors.secondaryColor,
  width: 40,
  height: 40,
);
/*
class LoginIcons {
  LoginIcons._();

  static const _kFontFam = 'LoginIcons';
  static const _kFontPkg = null;

  static const IconData password_hide =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData password_show =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData bleeding_eye =
      IconData(0xe933, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData burning_eye =
      IconData(0xe950, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
*/
