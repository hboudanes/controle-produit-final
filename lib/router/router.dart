import '../view/addproduit.dart';
import '../view/dosageproteines.dart';
import '../view/teneurcendre.dart';
import 'package:flutter/material.dart';
import '../view/suiviproduit.dart';
// import 'package:e_commerce/view/auth/loginscreen.dart';

Map<String, Widget Function(BuildContext)> route = <String, WidgetBuilder>{

  SuiviProduit.route: (context) => SuiviProduit(),
  AddProduit.route: (context) => AddProduit(),
  DosageProteines.route: (context) => DosageProteines(),
  TeneurCendre.route: (context) => TeneurCendre(),
};
