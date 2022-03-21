import 'package:dosage/view/aciditehuile.dart';

class Calcul {
  // retune la dose de protiene dans Echantillon (methode de Kjeldahl)
  static double proteinDose({required double mass, required double volume}) {
    return (volume * 0.1 * 1.401 * 6.25) / mass;
  }

  // retune la tenaur de cender
  static double teneurCender(
      {required double masseEchantillon,
      required double masseCreuset,
      required double masseCreusetChauffe}) {
    return (masseCreusetChauffe - masseCreuset) * 100 / masseEchantillon;
  }

  static double aciditeHuile({
    required double volume,
    required double mass,
  }) {
    return volume * 2.82 / mass;
  }
}
