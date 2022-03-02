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
}
