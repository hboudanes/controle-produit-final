import '../databasehelper.dart';
import '../extensions/number_verifier.dart';
import 'package:get/get.dart';
import '../customertools/methodecalcul.dart';
import '../model/produitfini.dart';
import '../controller/suiviproduitcontroller.dart';

class DosageController extends GetxController {
  
  double? masse;
  double? volume;
  String result = '';
  SuiviProduitController view = Get.put(SuiviProduitController());
  databasehelper c = databasehelper();
  void saveValue({required String value, required String type}) {
    double myDouble = double.parse(value);
    switch (type) {
      //masse Echantillon
      case "m":
        masse = myDouble;

        break;
      //La volume de naoh
      case "v":
        volume = myDouble;

        break;

      default:
    }
  }

  String? valide(String? value) {
    if (!value!.checkTryPars) {
      return 'Vérifiez votre saisie';
    }

    return null;
  }

  // Map<String,dynamic> argument
  void updateProduite(int parmID, int index) async {
    double resultDouble = Calcul.proteinDose(mass: masse!, volume: volume!);
    result = resultDouble.toStringAsFixed(12);
    var fido = ProduitFini(
      id: parmID,
      proteine: resultDouble,
    );
    await c.updateproduit(fido);
    view.updateList(index, resultDouble,'proteine');
    update();
  }
}
