import 'package:get/get.dart';
import '../databasehelper.dart';
import '../model/produitfini.dart';

class AddProduitController extends GetxController {
  String? date;
  int? jp;
  DatabaseHelper c = DatabaseHelper();
  void getDate(String value) {
    date = value;
  }

  void getJp(String value) {
    jp = int.parse(value);
  }

  void addProduit() async {
    if (date != null && jp != null) {
     
      var fido = ProduitFini(
        dateProduction: date!,
        jp: jp!,
      );
      await c.creatProduit(fido);
    }
  }
}
