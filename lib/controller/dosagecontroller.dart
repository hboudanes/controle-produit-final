import '../databasehelper.dart';
import '../extensions/number_verifier.dart';
import 'package:get/get.dart';
import '../customertools/methodecalcul.dart';
import '../model/produitfini.dart';

class DosageController extends GetxController {
  double? masse;
  double? volume;
  databasehelper c = databasehelper();
  RxString result = ''.obs;
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
  void updateProduite( )async {
     
      
      var fido = ProduitFini(
        id: 2,
        dateProduction: '2022-03-03',
        proteine: 32
      );
      await c.updateDog(fido);
    
  }
  String? valide(String? value) {
    if (!value!.checkTryPars) {
      return 'Vérifiez votre saisie';
    }

    return null;
  }

  get results {
    double resultDouble = Calcul.proteinDose(mass: masse!, volume: volume!);

    result.value = resultDouble.toStringAsFixed(12);

    print(result);
  }
}
