import 'package:get/get.dart';
import '../databasehelper.dart';
import '../model/produitfini.dart';

class addProduitController extends GetxController {
  String? date;
  int? jp;
  databasehelper c = databasehelper();
  void getdate(String value) {
    date = value;
  }

  void getJp(String value) {
    jp = int.parse(value);
  }

  void addProduit() async {
    if (date != null && jp != null) {
      print('hello');
      var fido = ProduitFini(
        dateProduction: date!,
        jp: jp!,
      );
      await c.creatProduit(fido);
    }
  }
}
