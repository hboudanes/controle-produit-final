class ProduitFini {
  final int id;
  final String dateProduction;
  final int jp;
  // double? proteine;
  // double? matiereGrasse;
  // double? cendres;
  // double? humidite;
  // double? acidite;
  ProduitFini({
    required this.dateProduction,
    required this.id,
    required this.jp,
    // this.proteine,
    // this.matiereGrasse,
    // this.cendres,
    // this.humidite,
    // this.acidite,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateProduction': dateProduction,
      'jp': jp,
    };
  }

  // @override
  // String toString() {
  //   return 'produits{id: $id, name: $dateProduction, age: $jp}';
  // }
}
