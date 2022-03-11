
import '../test.dart';
import '../view/dosageproteines.dart';
import '../view/teneurcendre.dart';
import 'package:flutter/material.dart';
import '../view/destest.dart';
// import 'package:e_commerce/view/auth/loginscreen.dart';

Map<String, Widget Function(BuildContext)> route = <String, WidgetBuilder>{
  '/': (context) =>testgetx(),
  // '/': (context) =>teu(),
  Dosageproteines.route: (context) => Dosageproteines(),
  teneurcendre.route : (context) => teneurcendre(),
};
