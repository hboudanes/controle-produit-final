import '../databasehelper.dart';
import '../extensions/number_verifier.dart';
import 'package:get/get.dart';
import '../customertools/methodecalcul.dart';
import '../model/produitfini.dart';
import '../controller/suiviproduitcontroller.dart';

class ProteineController extends GetxController {
  double? masse;
  double? volume;
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
      //La volume de naoh
      case "v":
        volume = myDouble;

        break;

      default:
    }
  }

  // Map<String,dynamic> argument
  void updateProteine(int parmID, int index) async {
    double resultDouble = Calcul.proteinDose(mass: masse!, volume: volume!);
    result = resultDouble.toStringAsFixed(12);
    var fido = ProduitFini(
      id: parmID,
      proteine: resultDouble,
    );
    await c.updateProteine(fido);
    view.updateList(index, resultDouble, 'proteine');
    update();
  }
}
