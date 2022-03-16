import '../databasehelper.dart';
import '../model/produitfini.dart';
import 'package:get/get.dart';

class SuiviProduitController extends GetxController {
  RxList<ProduitFini> produitFini = <ProduitFini>[].obs;

  DatabaseHelper c = DatabaseHelper();

  RxList isExpanded = [false].obs;

  void initProduitFini() async {
    produitFini = <ProduitFini>[].obs;
    produitFini.addAll(await c.allProduit());

    for (var i = 0; i < produitFini.length - 1; i++) {
      isExpanded.add(false);
    }
  }

  void updateList(int index, double resultDouble, String type) {
    for (var i = 0; i < produitFini.length - 1; i++) {
      isExpanded.add(false);
    }
    switch (type) {
      case "proteine":
      
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).proteine = resultDouble;
        produitFiniC = produitFini;
        break;
      case "cendres":
      
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).cendres = resultDouble;
        produitFiniC = produitFini;
        break;
      default:
        initProduitFini();
    }
  }

  @override
  void onInit() async {
    initProduitFini();
    super.onInit();
  }
}
