import '../router/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Deze c = Deze();
  c.createDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dosage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      routes: route,
    );
  }
}
