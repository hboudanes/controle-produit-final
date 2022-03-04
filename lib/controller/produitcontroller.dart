import '../model/produitfini.dart';
import 'package:get/get.dart';

class produitcontroller extends GetxController {
  RxList test = [
    {
      "titel": "hello word",
      "body ": "body te",
    },
    {
      "titel": "hello word",
      "body ": "body te",
    },
    {
      "titel": "hello word",
      "body ": "body te",
    }
  ].obs;

  var produitFini = <ProduitFini>[].obs;
  var d = 0.obs;
  RxList isExpanded = [false].obs;

  upd() {
    d++;
  }
  //  String? dateProduction;
  // int? jP;
  // double? proteine;
  // double? matiereGrasse;
  // double? cendres;
  // double? humidite;
  // double? acidite;
  initProduitFini() {
    produitFini.add(ProduitFini(dateProduction: '12/02/2019', jP: 1,proteine: 53,matiereGrasse: 8,cendres: 20,humidite: 6,acidite: 8));
    produitFini.add(ProduitFini(dateProduction: '12/02/2019', jP: 1,proteine: 53,matiereGrasse: 8,cendres: 20,humidite: 6,acidite: 8));
    produitFini.elementAt(0).dateProduction;
  }

  @override
  void onInit() {
    initProduitFini();
    for (var i = 0; i < produitFini.length - 1; i++) {
      isExpanded.add(false);
    }

    super.onInit();
  }
}
