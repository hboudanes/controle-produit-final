import '../database.dart';
import '../model/produitfini.dart';
import 'package:get/get.dart';

class ProduitController extends GetxController {
  var produitFini = <ProduitFini>[].obs;
  Deze c = Deze();
  var fido = ProduitFini(
    id: 0,
    dateProduction: '22/03/2',
    jp: 123,
  );
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
  }

  @override
  void onInit() async {
    await c.creatProduit(fido);
    initProduitFini();
    for (var i = 0; i < produitFini.length - 1; i++) {
      isExpanded.add(false);
    }

    super.onInit();
  }
}
