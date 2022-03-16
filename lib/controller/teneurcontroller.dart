import '../controller/suiviproduitcontroller.dart';
import 'package:get/get.dart';
import '../customertools/methodecalcul.dart';
import '../databasehelper.dart';
import '../model/produitfini.dart';

class TeneurController extends GetxController {
  double? masseEchantillon;
  double? masseCreuset;
  double? masseCreusetChauffe;
  String result = '';
  SuiviProduitController view = Get.put(SuiviProduitController());
  databasehelper c = databasehelper();

  void saveValue({required String value, required String type}) {
    double myDouble = double.parse(value);
    switch (type) {
      //masse Echantillon
      case "me":
        masseEchantillon = myDouble;
        print(masseEchantillon);
        break;
      //La Masse De Creuset
      case "mc":
        masseCreuset = myDouble;
        print(masseCreuset);
        break;
      //La Masse De Creuset Après Chauffage à 550 degrés
      case "mcc":
        masseCreusetChauffe = myDouble;
        print(masseCreusetChauffe);
        break;
      default:
    }
  }

  void updateCender(int parmID, int index) async {
    double resultDouble = Calcul.teneurCender(
        masseEchantillon: masseEchantillon!,
        masseCreuset: masseCreuset!,
        masseCreusetChauffe: masseCreusetChauffe!);
    result = resultDouble.toStringAsFixed(12);
    var fido = ProduitFini(
      id: parmID,
      cendres: resultDouble,
    );
    print('$parmID');
    print('$index');
    print('$resultDouble');
    await c.updateCendres(fido);
    view.updateList(index, resultDouble, 'cendres');
    update();
  }

  // get results {
  //   double resultDouble = Calcul.teneurCender(
  //       masseEchantillon: masseEchantillon!,
  //       masseCreuset: masseCreuset!,
  //       masseCreusetChauffe: masseCreusetChauffe!);
  //   result = resultDouble.toStringAsFixed(12);
  //   update();

  // }
}
