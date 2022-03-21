import 'package:get/get.dart';
import '../databasehelper.dart';
import '../model/produitfini.dart';

class SuiviProduitController extends GetxController {
  RxList<ProduitFini> produitFini = <ProduitFini>[].obs;
  // RxString? errortext = 'null'.obs;
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
    switch (type) {
      case "proteine":
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).proteine = resultDouble;
        produitFini = produitFiniC as RxList<ProduitFini>;
        isExpanded[index] = false;
        break;
      case "cendres":
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).cendres = resultDouble;
        produitFini = produitFiniC as RxList<ProduitFini>;
        isExpanded[index] = false;
        break;
      case "acidite":
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).acidite = resultDouble;
        produitFini = produitFiniC as RxList<ProduitFini>;
        isExpanded[index] = false;
        break;
      case "humidite":
        List<ProduitFini> produitFiniC = produitFini;
        produitFiniC.elementAt(index).humidite = resultDouble;
        produitFini = produitFiniC as RxList<ProduitFini>;
        isExpanded[index] = false;
        break;
      //
      default:
        initProduitFini();
    }
  }

  Future updatehumidite(int parmID, double resultDouble) async {
    print('hello');
    var fido = ProduitFini(
      id: parmID,
      humidite: resultDouble,
    );
    await c.updateHumidite(fido);
  }
  

  Future<void> createExcel() async {}

  @override
  void onInit() async {
    initProduitFini();
    super.onInit();
  }
}
