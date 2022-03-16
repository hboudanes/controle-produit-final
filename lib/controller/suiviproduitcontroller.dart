import '../databasehelper.dart';
import '../model/produitfini.dart';
import 'package:get/get.dart';

class SuiviProduitController extends GetxController {
  RxList<ProduitFini> produitFini = <ProduitFini>[].obs;
  databasehelper c = databasehelper();

  RxList isExpanded = [false].obs;

  void initProduitFini() async {
    produitFini = <ProduitFini>[].obs;
    produitFini.addAll(await c.allProduit());

    for (var i = 0; i < produitFini.length - 1; i++) {
      isExpanded.add(false);
    }
  }

  void updateList(int index, double resultDouble) {
    print('interieur');
    if (produitFini.elementAt(index).proteine != null) {
      print('interieur not null');
      produitFini.elementAt(index).proteine = resultDouble;
    }
  }

  @override
  void onInit() async {
    initProduitFini();
    super.onInit();
  }
}
