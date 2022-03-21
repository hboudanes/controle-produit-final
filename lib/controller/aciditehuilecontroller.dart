import '../controller/suiviproduitcontroller.dart';
import 'package:get/get.dart';
import '../customertools/methodecalcul.dart';
import '../databasehelper.dart';
import '../model/produitfini.dart';

class AciditeHuileController extends GetxController {
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
  void updateAcidite(int parmID, int index) async {
    double resultDouble = Calcul.aciditeHuile(mass: masse!, volume: volume!);
    result = resultDouble.toStringAsFixed(12);
    var fido = ProduitFini(
      id: parmID,
      acidite: resultDouble,
    );
    await c.updateAcidite(fido);
    view.updateList(index, resultDouble, 'acidite');
    update();
  }

}

 
