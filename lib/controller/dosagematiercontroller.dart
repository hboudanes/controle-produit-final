import '../extensions/number_verifier.dart';

import '../controller/suiviproduitcontroller.dart';
import 'package:get/get.dart';
import '../customertools/methodecalcul.dart';
import '../databasehelper.dart';
import '../model/produitfini.dart';

class DosageMatierController extends GetxController {
  double? masse;
  double? masseSec;
  double? masseExtra;
  String result = '';
  SuiviProduitController view = Get.put(SuiviProduitController());
  DatabaseHelper c = DatabaseHelper();

  void saveValue({required String value, required String type}) {
    double myDouble = double.parse(value);
    switch (type) {
      //masse Echantillon
      case "m":
        masse = myDouble;

        break;
      //La Masse De Creuset
      case "ms":
        masseSec = myDouble;

        break;
      //La Masse De Creuset Après Chauffage à 550 degrés
      case "me":
        masseExtra = myDouble;

        break;
      default:
    }
  }

  void updateMatiereGrasse(int parmID, int index) async {
    double resultDouble = Calcul.matiereGrasse(
        masse: masse!, masseSec: masseSec!, masseExtra: masseExtra!);
    result = resultDouble.toStringAsFixed(12);
    print('-------------');
    print(parmID.toString());
    print('-------------');
    var fido = ProduitFini(
      id: parmID,
      matiereGrasse: resultDouble,
    );

    await c.updateMatiereGrasse(fido);
    view.updateList(index, resultDouble, 'matiereGrasse');
    update();
  }
}
