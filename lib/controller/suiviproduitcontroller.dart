import '../databasehelper.dart';
import '../model/produitfini.dart';
import 'package:get/get.dart';

class SuiviProduitController extends GetxController {
  var produitFini = <ProduitFini>[].obs;
  databasehelper c = databasehelper();
 
  RxList isExpanded = [false].obs;
  //  String? dateProduction;
  // int? jP;
  // double? proteine;
  // double? matiereGrasse;
  // double? cendres;
  // double? humidite;
  // double? acidite;
  // initProduitFini() {
  //   produitFini.add(ProduitFini(dateProduction: '12/02/2019', jp: 1, id: 1));
  //   produitFini.add(ProduitFini(dateProduction: '12/02/2019', jp: 2, id: 2));
  // }

  initProduitFini() async {
    
    produitFini.addAll(await c.allProduit());

    for (var i = 0; i < produitFini.length - 1; i++) {
      isExpanded.add(false);
    }
  }

  @override
  void onInit() async {
    initProduitFini();
    super.onInit();
  }
}
