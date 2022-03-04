import 'package:get/get.dart';
import '../customertools/methodecalcul.dart';

class TeneurController extends GetxController {
  double? masseEchantillon;
  double? masseCreuset;
  double? masseCreusetChauffe;

  RxString result = ''.obs;
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

  get results {
    double resultDouble = Calcul.teneurCender(
        masseEchantillon: masseEchantillon!,
        masseCreuset: masseCreuset!,
        masseCreusetChauffe: masseCreusetChauffe!);
    result.value = resultDouble.toStringAsFixed(12);
    print('hicham');
    print(result);
  }
}
